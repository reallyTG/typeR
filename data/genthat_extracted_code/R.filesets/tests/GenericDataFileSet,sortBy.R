source("incl/start.R")

message("*** sortBy() on GenericDataFile")

# Example files
path <- system.file("exData", "dataSetA,original", package="R.filesets")
print(path)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Setting up a file set
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
ds <- GenericDataFileSet$byPath(path)
print(ds)

bys <- c("lexicographic", "filesize")
if (require("gtools")) bys <- c(bys, "mixeddecimal", "mixedroman")

for (by in bys) {
  for (decreasing in c(FALSE, TRUE)) {
    dsS  <- sortBy(ds, by=by, decreasing=FALSE)
    cat(sprintf("\nSort by '%s' (decreasing=%s):\n", by, decreasing))
    cat(sQuote(names(dsS)), sep="\n")
  }
}

source("incl/end.R")
