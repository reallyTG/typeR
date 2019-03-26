library(googleComputeEngineR)


### Name: gce_schedule_docker
### Title: Schedule running a docker image upon a VM
### Aliases: gce_schedule_docker

### ** Examples


## Not run: 
##D # create a Dockerfile of your script
##D if(!require(containeRit)){
##D   devtools::install_github("o2r-project/containerit")
##D   library(containeRit)
##D }
##D 
##D script <- system.file("schedulescripts", "schedule.R", package = "googleComputeEngineR")
##D 
##D ## put the "schedule.R" script in the working directory
##D file.copy(script, getwd())
##D 
##D 
##D ## it will run the script whilst making the dockerfile
##D container <- dockerfile("schedule.R",
##D                         copy = "script_dir",
##D                         cmd = CMD_Rscript("schedule.R"),
##D                         soft = TRUE)
##D write(container, file = "Dockerfile")
##D 
##D ## upload created Dockerfile to GitHub, 
##D   then use a Build Trigger to create Docker image "demoDockerScheduler"
##D ## built trigger uses "demo-docker-scheduler" as must be lowercase
##D 
##D ## After image is built:
##D ## Create a VM to run the schedule
##D vm <- gce_vm_scheduler("my_scheduler")
##D 
##D ## setup any SSH not on defaults
##D vm <- gce_vm_setup(vm, username = "mark")
##D 
##D ## get the name of the just built Docker image that runs your script
##D docker_tag <- gce_tag_container("demo-docker-scheduler", project = "gcer-public")
##D 
##D ## Schedule the docker_tag to run every day at 0453AM
##D gce_schedule_docker(docker_tag, schedule = "53 4 * * *", vm = vm)
##D 
##D 
## End(Not run)




