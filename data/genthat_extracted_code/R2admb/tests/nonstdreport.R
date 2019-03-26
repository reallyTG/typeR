library(R2admb)
setwd(system.file("admbtests",package="R2admb"))
rr <- read_admb("catage")
stopifnot(length(rr$report)==336)
