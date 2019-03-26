library(RCurl)


### Name: postForm
### Title: Submit an HTML form
### Aliases: postForm .postForm getForm
### Keywords: IO

### ** Examples


if(url.exists("http://www.google.com")) {
   # Two ways to submit a query to google. Searching for RCurl
  getURL("http://www.google.com/search?hl=en&lr=&ie=ISO-8859-1&q=RCurl&btnG=Search")

   # Here we let getForm do the hard work of combining the names and values.
  getForm("http://www.google.com/search", hl="en", lr="",
          ie="ISO-8859-1", q="RCurl", btnG="Search")

   # And here if we already have the parameters as a list/vector.
  getForm("http://www.google.com/search", .params = c(hl="en", lr="",
          ie="ISO-8859-1",  q="RCurl", btnG="Search"))
}


   # Now looking at POST method for forms.
url <- "http://wwwx.cs.unc.edu/~jbs/aw-wwwp/docs/resources/perl/perl-cgi/programs/cgi_stdin.cgi"
if(url.exists(url)) 
 postForm(url,
           name = "Bob", "checkedbox" = "spinich",
           submitButton = "Now!",
           textarea = "Some text to send",
           selectitem = "The item",
           radiobutton = "a", style = "POST")


  # Genetic database via the Web.
if(url.exists('http://www.wormbase.org/db/searches/advanced/dumper')) {
 x = postForm('http://www.wormbase.org/db/searches/advanced/dumper',
         species="briggsae",
         list="",
         flank3="0",
         flank5="0",
         feature="Gene Models",
         dump = "Plain TEXT",
         orientation = "Relative to feature",
         relative = "Chromsome",
         DNA ="flanking sequences only",
         .cgifields = paste(c("feature", "orientation", "DNA", "dump","relative"), collapse=", "))


 # Note that we don't have to paste multiple values together ourselves,
 # e.g. the .cgifields can be specified as a character vector rather
 # than a string.
 x = postForm('http://www.wormbase.org/db/searches/advanced/dumper',
         species="briggsae",
         list="",
         flank3="0",
         flank5="0",
         feature="Gene Models",
         dump = "Plain TEXT",
         orientation = "Relative to feature",
         relative = "Chromsome",
         DNA ="flanking sequences only",
         .cgifields =c("feature", "orientation", "DNA", "dump", "relative"))
}
	  



