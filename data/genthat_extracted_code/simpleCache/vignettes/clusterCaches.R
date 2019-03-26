## ----Try it out, eval=FALSE----------------------------------------------
#  library(simpleCache)
#  setCacheDir(tempdir())
#  
#  registry = batchtools::makeRegistry(NA)
#  templateFile = system.file("templates/slurm-advanced.tmpl", package = "simpleCache")
#  registry$cluster.functions = batchtools::makeClusterFunctionsSlurm(
#    template = templateFile)
#  registry

## ------------------------------------------------------------------------
resources = list(ncpus=1, memory=1000, walltime=60, partition="serial")

## ---- eval=FALSE---------------------------------------------------------
#  simpleCache("testBatch", {
#    rnorm(1e7, 0, 1)
#    }, batchRegistry=registry, batchResources=resources)

## ---- eval=FALSE---------------------------------------------------------
#  batchtools::getJobTable(reg=registry)
#  batchtools::getJobPars()
#  batchtools::getStatus()
#  
#  batchtools::getJobTable(reg=registry)
#  batchtools::getJobPars(1, reg=registry)
#  batchtools::loadResult(1, reg=registry)
#  # batchtools::testJob(1, reg=registry)
#  # killJobs()

## ---- eval=FALSE---------------------------------------------------------
#  batchtools::removeRegistry(reg=registry)

