library(RSauceLabs)


### Name: getJobs
### Title: Get Jobs
### Aliases: getJobs

### ** Examples

## Not run: 
##D myAcc <- account()
##D myJobs <- getJobs(myAcc)
##D #> myJobs$data[1,]
##D #id
##D #1: 4152e0a185f945bfa43e091eef1e7c30
##D myJobs <- getJobs(myAcc, getFullJobs = TRUE)
##D #> myJobs$data[1,.(id, browser)]
##D #id      browser
##D #1: 4152e0a185f945bfa43e091eef1e7c30 googlechrome
##D testId <- myJobs$data[1, id]
##D 
##D #> myJobs$data[1,.(build, passed)]
##D #build passed
##D #1:    24  FALSE
##D 
##D # update this job
##D updateJob(myAcc, jobID = testId, passed = TRUE, build = 20)
##D myJobs <- getJobs(myAcc, getFullJobs = TRUE)
##D #> myJobs$data[1,.(build, passed)]
##D #build passed
##D #1:    20   TRUE
##D # deleteJob(myAcc, jobID = testId)
##D stopJob(myAcc, jobID = testId)
##D 
##D jobAssets <- getJobAssetNames(myAcc, jobID = testId)
##D #> jobAssets[["selenium-log"]]
##D #[1] "selenium-server.log"
##D 
##D jobLog <- getJobAssetFiles(myAcc, jobID = testId)
##D # deleteJobAssets(myAcc, jobID = testId)
## End(Not run)




