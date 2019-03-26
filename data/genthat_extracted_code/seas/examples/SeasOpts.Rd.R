library(seas)


### Name: SeasOpts
### Title: Options for seas
### Aliases: SeasOpts setSeasOpts
### Keywords: utilities

### ** Examples

if(is.null(getOption("seas.main")))
  setSeasOpts()

# Modify an option
getOption("seas.main")$show.id
cp <- orig <- getOption("seas.main")
cp$show.id <- FALSE
options(seas.main=cp)
getOption("seas.main")$show.id

options(seas.main=orig)



