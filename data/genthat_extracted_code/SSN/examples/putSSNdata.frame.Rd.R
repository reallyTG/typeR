library(SSN)


### Name: putSSNdata.frame
### Title: putSSNdata.frame
### Aliases: putSSNdata.frame

### ** Examples


library(SSN)
#for examples, copy MiddleFork04.ssn directory to R's temporary directory
copyLSN2temp()
# NOT RUN
# Create a SpatialStreamNetork object that also contains prediction sites
#mf04 <- importSSN(paste0(tempdir(),'/MiddleFork04.ssn', o.write = TRUE))
#use mf04 SpatialStreamNetwork object, already created
data(mf04)
#for examples only, make sure mf04p has the correct path
#if you use importSSN(), path will be correct
mf04 <- updatePath(mf04, paste0(tempdir(),'/MiddleFork04.ssn'))

# Take out the data.frame, make a change and put it back
obs.df <- getSSNdata.frame(mf04)
obs.df$Year_cat <- as.factor(obs.df$SampleYear)
mf04 <- putSSNdata.frame(obs.df, mf04)




