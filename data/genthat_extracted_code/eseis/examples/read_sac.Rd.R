library(eseis)


### Name: read_sac
### Title: Read sac files.
### Aliases: read_sac

### ** Examples


## Not run: 
##D ## read one file
##D file1 <- "~/Data/sac/EXMP01.14.213.01.00.00.BHE.SAC"
##D 
##D sac1 <- read_sac(file = file1)
##D 
##D ## read two (or more files) without meta and header parts
##D file2 <- c("~/Data/sac/EXMP01.14.213.01.00.00.BHE.SAC",
##D            "~/Data/sac/EXMP01.14.213.02.00.00.BHE.SAC")
##D 
##D sac2 <- read_sac(file = file2, 
##D                  meta = FALSE, 
##D                  header = FALSE,
##D                  eseis = FALSE)
## End(Not run)




