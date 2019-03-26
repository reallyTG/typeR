library(RJSONIO)


### Name: fromJSON
### Title: Convert JSON content to R objects
### Aliases: fromJSON fromJSON,character,ANY-method
###   fromJSON,connection,ANY-method fromJSON,AsIs,ANY-method
###   fromJSON,AsIs,JSONParserHandler-method fromJSON,AsIs,NULL-method
###   fromJSON,AsIs,function-method fromJSON,AsIs,NativeSymbolInfo-method
###   Strict StrictNumeric StrictCharacter StrictLogical
### Keywords: IO programming

### ** Examples


  fromJSON(I(toJSON(1:10)))

  fromJSON(I(toJSON(1:10 + .5)))

  fromJSON(I(toJSON(c(TRUE, FALSE, FALSE, TRUE))))

  x = fromJSON('{"ok":true,"id":"x123","rev":"1-1794908527"}')


   # Reading from a connection. It is a text connection so we could
   # just read the text directly, but this could be a dynamic connection.
  m = matrix(1:27, 9, 3)
  txt = toJSON(m)
  con = textConnection(txt)
  identical(m, fromJSON(con)) # not true! fromJSON() returns just a list.

    # Use a connection and move the cursor ahead to skip over some lines.
  f = system.file("sampleData", "obj1.json", package = "RJSONIO")
  con = file(f, "r")
  readLines(con, 1)
  fromJSON(con)
  close(con)


  f = system.file("sampleData", "embedded.json", package = "RJSONIO")
  con = file(f, "r")
  readLines(con, 1)  # eat the first line
  fromJSON(con, maxNumLines = 4)
  close(con)

## Not run: 
##D if(require(rjson)) {
##D     # We see an approximately a factor of 3.9 speed up when we use
##D     # this approach that mixes C-level tokenization and an R callback
##D     # function to gather the results into objects.
##D     
##D   f = system.file("sampleData", "usaPolygons.as", package = "RJSONIO")
##D   t1 = system.time(a <- RJSONIO:::fromJSON(f))
##D   t2 = system.time(b <- fromJSON(paste(readLines(f), collapse = "\n")))
##D }
## End(Not run)
    # Use a C routine
  fromJSON(I("[1, 2, 3, 4]"),
           getNativeSymbolInfo("R_json_testNativeCallback", "RJSONIO"))

    # Use a C routine that populates an R integer vector with the
    # elements read from the JSON array. Note that we must ensure
    # that the array is big enough.
  fromJSON(I("[1, 2, 3, 4]"),
           getNativeSymbolInfo("R_json_IntegerArrayCallback", PACKAGE = "RJSONIO"),
           data = rep(1L, 5))

  x = fromJSON(I("[1.1, 2.2, 3.3, 4.4]"),
               getNativeSymbolInfo("R_json_RealArrayCallback", PACKAGE = "RJSONIO"),
                data = rep(1, 5))
  length(x) = 4


    # This illustrates a "specialized" handler which knows what it is
    #  expecting and pre-allocates the answer
    # This then populates the answer with the values.
    # The speed improvement is 1.8 versus "infinity"!

  x = rnorm(1000000)
  str = toJSON(x, digits = 6)
  
  fromJSON(I(str),
           getNativeSymbolInfo("R_json_RealArrayCallback", PACKAGE = "RJSONIO"),
           data = numeric(length(x)))


    # This is another example of very fast reading of specific JSON.
  x = matrix(rnorm(1000000), 1000, 1000)
  str = toJSON(x, digits = 6)
  
  v = fromJSON(I(str),
           getNativeSymbolInfo("R_json_RealArrayCallback", PACKAGE = "RJSONIO"),
           data = matrix(0, 1000, 1000))


    # nulls and NAs
  fromJSON("{ 'abc': 1, 'def': 23, 'xyz': null, 'ooo': 4}", nullValue = NA)
  fromJSON("{ 'abc': 1, 'def': 23, 'xyz': null, 'ooo': 4}", nullValue =  NULL) # default

  fromJSON("[1, 2, 3, null, 4]", nullValue = NA)
  fromJSON("[1, 2, 3, null, 4]", nullValue = NULL)


   # we can supply a complex object for null if we ever should need to.
  fromJSON('[ 1, 2, null]', nullValue = list(a = 1, b = 1:10))[[3]]


  # Using StrictNumeric, etc.
  x = list(sub1 = list(a = 1:10, b = 100, c = 1000),
           sub2 = list(animal1 = "ape", animal2 = "bear", animal3 = "cat"),
           sub3 = rep(c(TRUE, FALSE), 3))
  js = toJSON(x)

  fromJSON(js)
    # leave character strings uncollapsed
  fromJSON(js, simplify = StrictNumeric + StrictLogical)
  fromJSON(js, simplify = c(StrictNumeric, StrictLogical))


  fromJSON(js, simplifyWithNames = FALSE)
  fromJSON(js, simplifyWithNames = TRUE)

#######
#  stringFun
txt = '{ "magnitude": 3.8, 
         "longitude": -125.012, 
         "latitude": 40.382,
         "date":  "new Date(1335515917000)", 
         "when": "/Date(1335515917000)/", 
         "country": "USA", 
         "verified": true
       }'

convertJSONDate = 
function(x)
{
   if(grepl("/?(new )?Date\\(", x)) {
      val = gsub(".*Date\\(([0-9]+)\\).*", "\1", x)
      structure(as.numeric(val)/1000, class = c("POSIXct", "POSIXt"))
   } else
      x
}

fromJSON(txt, stringFun = convertJSONDate)

 #  A C routine for converting dates
jtxt = '[ 1, "/new Date(12312313)", "/Date(12312313)"]'
ans = fromJSON(jtxt)
ans = fromJSON(jtxt, stringFun = "R_json_dateStringOp")

 # A C routine that returns a char * - leaves strings as is
c = fromJSON(jtxt, stringFun = I("dummyStringOperation"))
c = fromJSON(jtxt, stringFun = I(getNativeSymbolInfo("dummyStringOperation")))
c = fromJSON(jtxt, stringFun =
                     I(getNativeSymbolInfo("dummyStringOperation")$address))

  # I() or class = "NativeStringRoutine".
c = fromJSON(jtxt, stringFun =
                      structure("dummyStringOperation",
                                class = "NativeStringRoutine"))



