library(RCurl)


### Name: complete
### Title: Complete an asynchronous HTTP request
### Aliases: complete complete,MultiCURLHandle-method
### Keywords: IO

### ** Examples

if(url.exists("http://eeyore.ucdavis.edu/cgi-bin/testForm1.pl")) {

  f = system.file("NAMESPACE", package = "RCurl")
   postForm("http://eeyore.ucdavis.edu/cgi-bin/testForm1.pl",
            "fileData" = fileUpload(f))


   postForm("http://eeyore.ucdavis.edu/cgi-bin/testForm1.pl",
            "fileData" = fileUpload("",
                                    paste(readLines(f), collapse = "\n"),
                                    "text/plain"))

   postForm("http://eeyore.ucdavis.edu/cgi-bin/testForm1.pl",
            "fileData" = fileUpload(f,
                                    paste(readLines(f), collapse = "\n")
                                    ),
            .opts = list(verbose = TRUE, header = TRUE))
}



