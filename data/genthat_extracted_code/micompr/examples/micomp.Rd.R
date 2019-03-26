library(micompr)


### Name: micomp
### Title: Multiple independent comparisons of observations
### Aliases: micomp

### ** Examples


# Create a micomp object from existing files and folders

dir_nl_ok <-
  system.file("extdata", "nl_ok", package = "micompr")
dir_jex_ok <-
  system.file("extdata", "j_ex_ok", package = "micompr")
dir_jex_noshuff <-
  system.file("extdata", "j_ex_noshuff", package = "micompr")
dir_jex_diff <-
  system.file("extdata", "j_ex_diff", package = "micompr")
files <- glob2rx("stats400v1*.tsv")

mic <- micomp(7, 0.8,
              list(list(name = "NLOKvsJEXOK",
                        folders = c(dir_nl_ok, dir_jex_ok),
                        files = c(files, files),
                        lvls = c("NLOK", "JEXOK")),
                   list(name = "NLOKvsJEXNOSHUFF",
                        folders = c(dir_nl_ok, dir_jex_noshuff),
                        files = c(files, files),
                        lvls = c("NLOK", "JEXNOSHUFF")),
                   list(name = "NLOKvsJEXDIFF",
                        folders = c(dir_nl_ok, dir_jex_diff),
                        files = c(files, files),
                        lvls = c("NLOK", "JEXDIFF"))),
              concat = TRUE)

## No test: 
# Create a micomp object from package datasets (i.e. grpoutputs objects)
# directly

mic <- micomp(c("o1", "o2", "o3", "o4"), 0.9,
              list(list(name = "NLOKvsJEXOK", grpout = pphpc_ok),
                   list(name = "NLOKvsJEXNOSHUFF", grpout = pphpc_noshuff),
                   list(name = "NLOKvsJEXDIFF", grpout = pphpc_diff)))

# Create a micomp object using manually inserted data

mic <- micomp(6, 0.5, list(
  list(name = "NLOKvsJEXOK",
       grpout = list(data = pphpc_ok$data,
                     obs_lvls = pphpc_ok$obs_lvls)),
  list(name = "NLOKvsJEXNOSHUFF",
       grpout = list(data = pphpc_noshuff$data,
                     obs_lvls = pphpc_noshuff$obs_lvls)),
  list(name = "NLOKvsJEXDIFF",
       grpout = list(data = pphpc_diff$data,
                     obs_lvls = pphpc_diff$obs_lvls))))
## End(No test)



