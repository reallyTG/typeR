library(dplR)


### Name: write.tucson
### Title: Write Tucson Format Chronology File
### Aliases: write.tucson
### Keywords: IO

### ** Examples
library(utils)
data(co021)
co021.hdr <- list(site.id = "CO021",
                  site.name = "SCHULMAN OLD TREE NO. 1, MESA VERDE",
                  spp.code = "PSME", state.country = "COLORADO",
                  spp = "DOUGLAS FIR", elev = "2103M", lat = 3712,
                  long = -10830, first.yr = 1400, last.yr = 1963,
                  lead.invs = "E. SCHULMAN", comp.date = "")
fname <- write.tucson(rwl.df = co021, fname = tempfile(fileext=".rwl"),
                      header = co021.hdr, append = FALSE, prec = 0.001)
print(fname) # tempfile used for output

unlink(fname) # remove the file



