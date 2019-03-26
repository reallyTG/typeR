library(tictoc)


### Name: tic
### Title: Timing utilities.
### Aliases: tic tic.clear tic.clearlog tic.log toc toc.outmsg

### ** Examples

## Not run: 
##D 
##D ## Basic use case
##D tic()
##D print("Do something...")
##D Sys.sleep(1)
##D toc()
##D # 1.034 sec elapsed
##D 
##D ## Inline timing example, similar to system.time()
##D tic(); for(i in 1:1000000) { j = i / 2 }; toc()
##D # 0.527 sec elapsed
##D 
##D ## Timing multiple steps
##D tic("step 1")
##D print("Do something...")
##D Sys.sleep(1)
##D toc()
##D # step 1: 1.005 sec elapsed
##D 
##D tic("step 2")
##D print("Do something...")
##D Sys.sleep(1)
##D toc()
##D # step 2: 1.004 sec elapsed
##D 
##D ## Timing nested code
##D tic("outer")
##D    Sys.sleep(1)
##D    tic("middle")
##D       Sys.sleep(2)
##D       tic("inner")
##D          Sys.sleep(3)
##D       toc()
##D # inner: 3.004 sec elapsed
##D    toc()
##D # middle: 5.008 sec elapsed
##D toc()
##D # outer: 6.016 sec elapsed
##D 
##D ## Timing in a loop and analyzing the results later using tic.log().
##D tic.clearlog()
##D for (x in 1:10)
##D {
##D    tic(x)
##D    Sys.sleep(1)
##D    toc(log = TRUE, quiet = TRUE)
##D }
##D log.txt <- tic.log(format = TRUE)
##D log.lst <- tic.log(format = FALSE)
##D tic.clearlog()
##D 
##D timings <- unlist(lapply(log.lst, function(x) x$toc - x$tic))
##D mean(timings)
##D # [1] 1.001
##D writeLines(unlist(log.txt))
##D # 1: 1.002 sec elapsed
##D # 2: 1 sec elapsed
##D # 3: 1.002 sec elapsed
##D # 4: 1.001 sec elapsed
##D # 5: 1.001 sec elapsed
##D # 6: 1.001 sec elapsed
##D # 7: 1.001 sec elapsed
##D # 8: 1.001 sec elapsed
##D # 9: 1.001 sec elapsed
##D # 10: 1 sec elapsed
##D 
##D ## Using custom callbacks in tic/toc
##D my.msg.tic <- function(tic, msg)
##D {
##D    if (is.null(msg) || is.na(msg) || length(msg) == 0)
##D    {
##D       outmsg <- paste(round(toc - tic, 3), " seconds elapsed", sep="")
##D    }
##D    else
##D    {
##D       outmsg <- paste("Starting ", msg, "...", sep="")
##D    }
##D }
##D 
##D my.msg.toc <- function(tic, toc, msg, info)
##D {
##D    if (is.null(msg) || is.na(msg) || length(msg) == 0)
##D    {
##D       outmsg <- paste(round(toc - tic, 3), " seconds elapsed", sep="")
##D    }
##D    else
##D    {
##D       outmsg <- paste(info, ": ", msg, ": ",
##D                    round(toc - tic, 3), " seconds elapsed", sep="")
##D    }
##D }
##D 
##D tic("outer", quiet = FALSE, func.tic = my.msg.tic)
##D # Starting outer...
##D    Sys.sleep(1)
##D    tic("middle", quiet = FALSE, func.tic = my.msg.tic)
##D # Starting middle...
##D       Sys.sleep(2)
##D       tic("inner", quiet = FALSE, func.tic = my.msg.tic)
##D          Sys.sleep(3)
##D # Starting inner...
##D       toc(quiet = FALSE, func.toc = my.msg.toc, info = "INFO")
##D # INFO: inner: 3.005 seconds elapsed
##D    toc(quiet = FALSE, func.toc = my.msg.toc, info = "INFO")
##D # INFO: middle: 5.01 seconds elapsed
##D toc(quiet = FALSE, func.toc = my.msg.toc, info = "INFO")
##D # INFO: outer: 6.014 seconds elapsed
##D 
## End(Not run)



