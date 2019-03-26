## ----echo=FALSE, results="hide"------------------------------------------
knitr::opts_chunk$set(
    cache = FALSE,
    echo = TRUE,
    collapse = TRUE,
    comment = "#>"
)
options(clustermq.scheduler = "local")
library(clustermq)

## ----eval=FALSE----------------------------------------------------------
#  # this will block until a worker is ready
#  msg = w$receive_data()

## ----eval=FALSE----------------------------------------------------------
#  # create a reusable, serialized ZeroMQ object with the common data on the master
#  w$set_common_data(fun, const, export, rettype, common_seed, token)

## ----eval=FALSE----------------------------------------------------------
#  chunk = data.frame(arg1=1:5, arg2=5:1, ` id `=1:5)
#  w$send_job_data(chunk)

## ----eval=FALSE----------------------------------------------------------
#  msg = w$receive_data()
#  if (!is.null(msg$result)) {
#      # store result here, handle errors/warnings if required
#  }

## ----eval=FALSE----------------------------------------------------------
#  w$send_call(expr, env=list(...), ref="mycall1")

## ----eval=FALSE----------------------------------------------------------
#  w = workers(3)
#  on.exit(w$finalize())
#  
#  while (we have new work to send) {
#      msg = w$receive_data()
#  
#      if (!is.null(msg$result))
#          # handle result
#  
#      if (msg$token != <token>)
#          w$send_common_data()
#      else
#          w$send_job_data(...)
#  }
#  
#  # if proper cleanup is successful, cancel kill-on-exit
#  if (w$cleanup())
#      on.exit()

## ----eval=FALSE----------------------------------------------------------
#  w = workers(n_jobs, ...)
#  # w$cleanup() for a clean shutdown at the end

## ----eval=FALSE----------------------------------------------------------
#  # create a reusable, serialized ZeroMQ object with the common data on the master
#  w$set_common_data()
#  # send this object to a worker
#  w$send_common_data()

## ----eval=FALSE----------------------------------------------------------
#  w$send_job_data()

## ----eval=FALSE----------------------------------------------------------
#  w$send_call()

## ----eval=FALSE----------------------------------------------------------
#  w$send_wait()

## ----eval=FALSE----------------------------------------------------------
#  w$send_shutdown_worker()

## ----eval=FALSE----------------------------------------------------------
#  w$disconnect_worker()

## ----eval=FALSE----------------------------------------------------------
#  w$set_common_data(...)
#  
#  while(work remaining or w$workers_running > 0) {
#      msg = w$receive_data() # wait until a worker is ready
#      if (msg$id == "WORKER_UP") { # treat same as WORKER_READY if no common data
#          w$send_common_data()
#      } else if (msg$id == "WORKER_READY") {
#          if (work remaining)
#              w$send_job_data(data.frame with arguments for all calls of this chunk)
#          else
#              w$send_shutdown_worker()
#          # ..handle your result..
#      } else if (msg$id == "WORKER_DONE") {
#          w$disconnect_worker()
#      } else if (msg$id == "WORKER_ERROR") {
#          stop("processing error")
#      }
#  }

## ----eval=FALSE----------------------------------------------------------
#  w$set_common_data(...) # optional, if common data required
#  
#  while(work remaining or w$workers_running > 0) {
#      msg = w$receive_data() # wait until a worker is ready
#      if (msg$id == "WORKER_UP") { # treat same as WORKER_READY if no common data
#          w$send_common_data()
#      } else if (msg$id == "WORKER_READY") {
#          if (work remaining)
#              w$send_call(expr, env)
#          else
#              w$send_shutdown_worker()
#          # ..handle your result..
#      } else if (msg$id == "WORKER_DONE") {
#          w$disconnect_worker()
#      } else if (msg$id == "WORKER_ERROR") {
#          stop("processing error")
#      }
#  }

