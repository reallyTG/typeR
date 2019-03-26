library(ssh.utils)


### Name: cp.remote
### Title: scp wrapper
### Aliases: cp.remote

### ** Examples

## Not run: 
##D ## Copy file myfile.csv from the home directory on the remote server to
##D ## the local working directory.
##D 
##D ## on remote server in bash shell:
##D # cat myfile.csv
##D # [me@myserver ~]$ cat myfile.csv
##D # "val","ts"
##D # 1,
##D # 2,
##D # 3,
##D # 4,
##D # 5,
##D # 6,
##D # 7,
##D # 8,
##D # 9,
##D # 10,
##D 
##D ## on local server in R:
##D cp.remote(remote.src = "me@myserver", path.src = "~/myfile.csv",
##D           remote.dest = "", path.dest = getwd(), verbose = TRUE)
##D # [1] "Elapsed: 1.672 sec"
##D df <- read.csv("myfile.csv")
##D df
##D #    val ts
##D # 1    1 NA
##D # 2    2 NA
##D # 3    3 NA
##D # 4    4 NA
##D # 5    5 NA
##D # 6    6 NA
##D # 7    7 NA
##D # 8    8 NA
##D # 9    9 NA
##D # 10  10 NA
## End(Not run)



