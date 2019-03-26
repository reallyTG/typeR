library(sfsmisc)


### Name: Sys.cpuinfo
### Title: Provide Information about the Linux Hardware (CPU, Memory, etc)
### Aliases: Sys.procinfo Sys.cpuinfo Sys.meminfo Sys.memGB Sys.MIPS
### Keywords: utilities

### ** Examples

(n.cores <- parallel::detectCores())
if(substr(R.version[["os"]], 1,5) == "linux") { ##-- only on Linux
  Sys.cpuinfo() # which is often ugly; this looks much better:
  length(Sys.cpu2 <- local({I <- Sys.cpuinfo(); I[ !grepl("^flags", names(I)) ] }))
  ## may still be too much, notably if n.cores > 2:
  (Sys3 <- Sys.cpu2[!grepl("[.][0-9]+$", names(Sys.cpu2))])

  Sys.MIPS() ## just the 'bogomips' from above:
  Sys.MIPS() / as.numeric(Sys.cpuinfo()["cpu.MHz"]) ## ~~ 2 * #{cores} ((no longer))

  ## Available Memory -- can be crucial:
  Sys.memGB() #- default "MemTotal"
  if(Sys.memGB("MemFree") > 16)
     message("Be happy! You have more than 16 Gigabytes of free memory")
}



