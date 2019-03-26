library(namedCapture)


### Name: df_match_variable
### Title: df match variable
### Aliases: df_match_variable

### ** Examples


library(namedCapture)
(sacct.df <- data.frame(
  JobID = c(
    "13937810_25", "13937810_25.batch", 
    "13937810_25.extern", "14022192_[1-3]", "14022204_[4]"),
  ExitCode = c("0:0", "0:0", "0:0", "0:0", "0:0"),
  State = c(
    "COMPLETED", "COMPLETED", "COMPLETED",
    "PENDING", "PENDING"),
  MaxRSS = c("", "394960K", "750K", "", ""),
  Elapsed = c(
    "07:04:42", "07:04:42", "07:04:49",
    "00:00:00", "00:00:00"),
  stringsAsFactors=FALSE))
range.pattern <- list(
  "[[]",
  task1="[0-9]+", as.integer,
  "(?:-",#begin optional end of range.
  taskN="[0-9]+", as.integer,
  ")?", #end is optional.
  "[]]")
task.pattern <- list(
  "(?:",#begin alternate
  task="[0-9]+", as.integer,
  "|",#either one task(above) or range(below)
  range.pattern,
  ")")#end alternate
(task.df <- df_match_variable(
  sacct.df,
  JobID=list(
    job="[0-9]+", as.integer,
    "_",
    task.pattern,
    "(?:[.]",
    type=".*",
    ")?"),
  Elapsed=list(
    hours="[0-9]+", as.integer,
    ":",
    minutes="[0-9]+", as.integer,
    ":",
    seconds="[0-9]+", as.integer)))
str(task.df)




