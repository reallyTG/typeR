library(flowr)


### Name: job
### Title: Describing details of the job object
### Aliases: job

### ** Examples

qobj <- queue(platform="torque")

## torque job with 1 CPU running command 'sleep 2'
jobj <- job(q_obj=qobj, cmd = "sleep 2", cpu=1)

## multiple commands
cmds = rep("sleep 5", 10)

## run the 10 commands in parallel
jobj1 <- job(q_obj=qobj, cmd = cmds, submission_type = "scatter", name = "job1")

## run the 10 commands sequentially, but WAIT for the previous job to complete
jobj2 <- job(q_obj=qobj, cmd = cmds, submission_type = "serial",
   dependency_type = "gather", previous_job = "job1")

fobj <- flow(jobs = list(jobj1, jobj2))

## plot the flow
plot_flow(fobj)
## Not run: 
##D ## dry run, only create the structure without submitting jobs
##D submit_flow(fobj)
##D 
##D ## execute the jobs: ONLY works on computing cluster, would fail otherwise
##D submit_flow(fobj, execute = TRUE)
##D 
## End(Not run)



