library(mefa4)


### Name: nameAlnum
### Title: Utility functions, mostly for character manipulation
### Aliases: nameAlnum pasteDate paste0date normalizeNames
### Keywords: manip

### ** Examples

paste0(pasteDate("file", "name", sep="-", sep.date="_"), ".csv")
paste0(paste0date("file", "name", sep.date="_"), ".csv")

data(abmibirds)
x <- data.frame(Name=levels(abmibirds[["Common.Name"]]),
    NameAlnum=nameAlnum(levels(abmibirds[["Common.Name"]])))
x[grep("'", x$Name),]

data.frame(out=sapply(c("asis", "first", "none", "all", "mixed"),
    function(z) nameAlnum("Olive-sided Flycatcher", z)))

z <- data.frame(Name=levels(abmibirds[["Common.Name"]]),
    NameNormalized=normalizeNames(levels(abmibirds[["Common.Name"]]),
        pattern=list("'", "-", " "), replacement=list("", "_", "_")))
z[grepl("'", z$Name) & grepl("-", z$Name),]



