library(lfstat)


### Name: multistationsreport
### Title: Report for several stations
### Aliases: multistationsreport

### ** Examples

data(ngaruroro)
multistationsreport(ngaruroro, indices = c("meanflow", "MAM7"))

seventies <- subset(ngaruroro, hyear %in% 1970:1979)
eighties <- subset(ngaruroro, hyear %in% 1980:1989)
nineties <- subset(ngaruroro, hyear %in% 1990:1999)

multistationsreport(seventies, eighties, nineties)



