library(RCurl)


### Name: base64
### Title: Encode/Decode base64 content
### Aliases: base64 base64Encode base64Decode
### Keywords: IO programming

### ** Examples

    # encode and then decode a simple string.
  txt = "Some simple text for base 64 to handle"
  x = base64(txt)
  base64(x)

    # encode to a raw vector
  x = base64("Simple text", TRUE, "raw")

    # decode to a character string.
  ans = base64Decode(x)
  ans == txt
    # decoded to a raw format.
  ans = base64Decode(x, "raw")


   # Binary data
#  f = paste(R.home(), "doc", "html", "logo.jpg", sep = .Platform$file.sep)
  f = system.file("examples", "logo.jpg", package = "RCurl")
  img = readBin(f, "raw", file.info(f)[1, "size"])
  b64 = base64Encode(img, "raw")
  back = base64Decode(b64, "raw")
  identical(img, back)

   # alternatively, we can encode to a string and then decode back again
   # to raw and see that we preserve the date.
 
  enc = base64Encode(img, "character")
  dec = base64Decode(enc, "raw")
  identical(img, dec)


   # The following would be the sort of computation we could do if we
   # could have in-memory raw connections.
   # We would save() some objects to such an in-memory binary/raw connection
   # and then encode the resulting raw vector into a character vector.
   # Then we can insert that into a message, e.g. an email message or
   # an XML document and when we receive it in a different R session
   # we would get the string and reverse the encoding from the string to
   # a raw vector
   # In the absence of that in-memory connection  facility in save(),
   # we can use a file.
  
  x = 1:10

   # save two objects - a function and a vector
  f = paste(tempfile(), "rda", sep = ".")
  save(base64, x, file = f)

   # now read the results back from that file as a raw vector
  data = readBin(f, "raw", file.info(f)[1,"size"])

   # base64 encode it
  txt = base64Encode(data, "character")

  if(require(XML)) {
    tt = xmlTree("r:data", namespaces = c(r = "http://www.r-project.org"))
    tt$addNode(newXMLTextNode(txt))
    out = saveXML(tt)


    doc = xmlRoot(xmlTreeParse(out, asText = TRUE))
    rda = base64Decode(xmlValue(doc), "raw")
    f = tempfile()
    writeBin(rda, f)
    e = new.env()
    load(f, e)
    objects(e)
  }

   # we'd like to be able to do
   #  con = rawConnection(raw(), 'r+')
   #  save(base64, x, file = con)
   #  txt = base64Encode(rawConnectionValue(con), "character")
   # ... write and read xml stuff
   #  val = xmlValue(doc)
   #  rda = base64Decode(val, "raw")
   #  e = new.env()
   #  input = rawConnection(o, "r")
   #  load(input, e)



