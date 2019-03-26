## ---- echo = FALSE-------------------------------------------------------
pkgVersion <- packageDescription("seroincidence")$Version
pkgLicense <- packageDescription("seroincidence")$License
pkgDate <- packageDescription("seroincidence")$Date
authorsString <- gsub("^ *|(?<= ) |\n| *$", "", packageDescription("seroincidence")$Authors, perl = TRUE)
authorList <- eval(parse(text = authorsString))
pkgAuthors <- paste(format(authorList,
                           include = c("given", "family", "email", "comment"), 
                           braces = list(family = c("", ",<br />"),
                                         email = c("<", ">,<br />"), 
                                         comment = c("", ""))), 
                    collapse = "<br /><br />")
pkgMaintainer <- packageDescription("seroincidence")$Maintainer
pkgBaseFileName <- paste("seroincidence", pkgVersion, sep = "_")
pkgUrl <- packageDescription("seroincidence")$URL

