initTesting <- function(name) {
  theCounter <<- 1
  theWorkingDir <<- tempfile(pattern=name)
  dir.create(theWorkingDir)
  setwd(theWorkingDir)
}

writeToDepFile <- function(f) {
  cat(paste0(as.character(as.numeric(Sys.time())), '\n'), file=f)
}

createScriptFile <- function(f, out) {
  cat(paste0('cat(paste0(as.character(as.numeric(Sys.time())), "\\n"), file="', out, '")\n', collapse=''),
      file=f)
}

createMakefile <- function(...) {
  rmakeSkeleton('.')
  Sys.sleep(1)
  cat(paste(..., sep='\n'), file='Makefile.R')
}

contentGreater <- function(f1, f2) {
  v1 <- read.table(f1)
  v2 <- read.table(f2)
  return(v1[1,1] > v2[1,1])
}

runSystem <- function(cmd, args=character()) {
  try(system2(command=cmd, args=args, wait=TRUE), silent=FALSE)
}
