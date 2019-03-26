library(RefManageR)


### Name: print.BibEntry
### Title: Print BibLaTeX bibliography Entries
### Aliases: print.BibEntry

### ** Examples

file.name <- system.file("Bib", "biblatexExamples.bib", package="RefManageR")
bib <- suppressMessages(ReadBib(file.name))
print(bib[author="aristotle"], .opts = list(bib.style = "numeric"))
print(bib[55:57], .opts = list(bib.style = "authortitle", first.inits = FALSE))
print(bib[80:88], .opts = list(bib.style = "alphabetic", max.names = 1,
      no.print.fields = "issn"))
print(bib[32:36], .opts = list(bib.style = "draft"))
oldopts <- BibOptions(bib.style = "authoryear", dashed = TRUE, sorting = "ydnt")
bib[editor = "westfahl"]
BibOptions(oldopts)



