library(flowr)


### Name: flow-class
### Title: Describing the flow class
### Aliases: flow flow-class

### ** Examples

cmds = rep("sleep 5", 10)
qobj <- queue(platform='torque')
## run the 10 commands in parallel
jobj1 <- job(q_obj=qobj, cmd = cmds, submission_type = "scatter", name = "job1")

## run the 10 commands sequentially, but WAIT for the previous job to complete
## Many-To-One
jobj2 <- job(q_obj=qobj, cmd = cmds, submission_type = "serial",
 dependency_type = "gather", previous_job = "job1", name = "job2")

## As soon as first job on 'job1' is complete
## One-To-One
jobj3 <- job(q_obj=qobj, cmd = cmds, submission_type = "scatter",
 dependency_type = "serial", previous_job = "job1", name = "job3")

fobj <- flow(jobs = list(jobj1, jobj2, jobj3))

## plot the flow
plot_flow(fobj)
## Not run: 
##D ## dry run, only create the structure without submitting jobs
##D submit_flow(fobj)
##D 
##D ## execute the jobs: ONLY works on computing cluster, would fail otherwise
##D submit_flow(fobj, execute = TRUE)
## End(Not run)



