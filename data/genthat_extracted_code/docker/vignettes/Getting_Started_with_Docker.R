## ----cran, eval=FALSE----------------------------------------------------
#  install.packages('docker')

## ----github, eval=FALSE--------------------------------------------------
#  if(!require(devtools)) {
#    install.packages("devtools")
#  }
#  devtools::install_github('user001vk/docker')

## ----hello-world, eval=FALSE---------------------------------------------
#  # This is a hint to the reticulate package to find a
#  # python environment with the "docker" python module available.
#  reticulate::use_virtualenv("docker")
#  library(docker)
#  client <- docker$from_env()
#  s <- client$containers$run("alpine", 'echo -n "Hello World!"', remove=TRUE)
#  print(s$decode("UTF-8"))

## ----redis, eval=FALSE---------------------------------------------------
#  reticulate::py_discover_config("docker")
#  library(docker)
#  library(rredis)
#  
#  docker_client <- docker$from_env()
#  docker_client$ping()
#  
#  redis_instance <- docker_client$containers$run(
#    'redis', name='redis', detach=TRUE, ports=list('6379/tcp'='6379'))
#  redis_instance$status
#  
#  redisConnect(host='127.0.0.1', port=6379, nodelay=TRUE)
#  redisSet('docker-test', rnorm(20))
#  redisGet('docker-test')
#  
#  redis_instance$stop()
#  redis_instance$remove()

