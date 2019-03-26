library(RefManageR)


### Name: [.BibEntry
### Title: Search BibEntry objects by field
### Aliases: [.BibEntry SearchBib [.BibEntry
### Keywords: database list manip

### ** Examples

file.name <- system.file("Bib", "biblatexExamples.bib", package="RefManageR")
bib <- suppressMessages(ReadBib(file.name))

## author search, default is to use family names only for matching
bib[author = "aristotle"]

## Aristotle references before 1925
bib[author="aristotle", date = "/1925"]

## Aristotle references before 1925 *OR* references with editor Westfahl
bib[list(author="aristotle", date = "/1925"),list(editor = "westfahl")]

## Change some searching and printing options and search for author
old.opts <- BibOptions(bib.style = "authoryear", match.author = "exact",
  max.names = 99, first.inits = FALSE)
bib[author="Mart\u00edn, Jacinto and S\u00e1nchez, Alberto"]
BibOptions(old.opts)  ## reset options

## Some works of Raymond J. Carroll's
file.name <- system.file("Bib", "RJC.bib", package="RefManageR")
bib <- ReadBib(file.name)
length(bib)

## index by key
bib[c("chen2013using", "carroll1978distributions")]

## Papers with someone with family name Wang
length(SearchBib(bib, author='Wang', .opts = list(match.author = "family")))

## Papers with Wang, N.
length(SearchBib(bib, author='Wang, N.', .opts = list(match.author = "family.with.initials")))

## tech reports with Ruppert
length(bib[author='ruppert',bibtype="report"])

##Carroll and Ruppert tech reports at UNC
length(bib[author='ruppert',bibtype="report",institution="north carolina"])

## Carroll and Ruppert papers since leaving UNC
length(SearchBib(bib, author='ruppert', date="1987-07/",
   .opts = list(match.date = "exact")))

## Carroll and Ruppert papers NOT in the 1990's
## Not run: 
##D length(SearchBib(bib, author='ruppert', date = "!1990/1999"))
##D identical(SearchBib(bib, author='ruppert', date = "!1990/1999"),
##D   SearchBib(bib, author='ruppert', year = "!1990/1999"))
##D table(unlist(SearchBib(bib, author='ruppert', date="!1990/1999")$year))
##D 
##D ## Carroll + Ruppert + Simpson
##D length(bib[author="Carroll, R. J. and Simpson, D. G. and Ruppert, D."])
##D 
##D ## Carroll + Ruppert OR Carroll + Simpson
##D length(bib[author=c("Carroll, R. J. and Ruppert, D.", "Carroll, R. J. and Simpson, D. G.")])
##D 
##D ## Carroll + Ruppert tech reports at UNC "OR" Carroll and Ruppert JASA papers
##D length(bib[list(author='ruppert',bibtype="report",institution="north carolina"),
##D   list(author="ruppert",journal="journal of the american statistical association")])
## End(Not run)



