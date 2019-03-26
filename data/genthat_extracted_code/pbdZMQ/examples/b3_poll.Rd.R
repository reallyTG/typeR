library(pbdZMQ)


### Name: Poll Functions
### Title: Poll Functions
### Aliases: 'Poll Functions' zmq.poll zmq.poll.free zmq.poll.length
###   zmq.poll.get.revents
### Keywords: programming

### ** Examples

## Not run: 
##D ### Using poll pattern.
##D ### See demo/mspoller.r for details.
##D 
##D ### Run next in background or the other window.
##D SHELL> Rscript wuserver.r &
##D SHELL> Rscript taskvent.r &
##D SHELL> Rscript mspoller.r
##D 
##D ### The mspoller.r has next.
##D library(pbdZMQ, quietly = TRUE)
##D 
##D ### Initial.
##D context <- zmq.ctx.new()
##D receiver <- zmq.socket(context, .pbd_env$ZMQ.ST$PULL)
##D zmq.connect(receiver, "tcp://localhost:5557")
##D subscriber <- zmq.socket(context, .pbd_env$ZMQ.ST$SUB)
##D zmq.connect(subscriber, "tcp://localhost:5556")
##D zmq.setsockopt(subscriber, .pbd_env$ZMQ.SO$SUBSCRIBE, "20993")
##D 
##D ### Process messages from both sockets.
##D cat("Press Ctrl+C or Esc to stop mspoller.\n")
##D i.rec <- 0
##D i.sub <- 0
##D while(TRUE){
##D   ### Set poller.
##D   zmq.poll(c(receiver, subscriber),
##D            c(.pbd_env$ZMQ.PO$POLLIN, .pbd_env$ZMQ.PO$POLLIN))
##D 
##D   ### Check receiver.
##D   if(bitwAnd(zmq.poll.get.revents(1), .pbd_env$ZMQ.PO$POLLIN)){
##D     ret <- zmq.recv(receiver)
##D     if(ret$len != -1){
##D       cat("task ventilator:", ret$buf, "at", i.rec, "\n")
##D       i.rec <- i.rec + 1
##D     }
##D   }
##D 
##D   ### Check subscriber.
##D   if(bitwAnd(zmq.poll.get.revents(2), .pbd_env$ZMQ.PO$POLLIN)){
##D     ret <- zmq.recv(subscriber)
##D     if(ret$len != -1){
##D       cat("weather update:", ret$buf, "at", i.sub, "\n")
##D       i.sub <- i.sub + 1
##D     }
##D   }
##D 
##D   if(i.rec >= 5 & i.sub >= 5){
##D     break
##D   }
##D 
##D   Sys.sleep(runif(1, 0.5, 1))
##D }
##D 
##D ### Finish.
##D zmq.poll.free()
##D zmq.close(receiver)
##D zmq.close(subscriber)
##D zmq.ctx.destroy(context)
## End(Not run)




