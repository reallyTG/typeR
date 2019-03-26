library(LexisNexisTools)


### Name: lnt_rename
### Title: Assign proper names to LexisNexis TXT files
### Aliases: lnt_rename
### Keywords: LexisNexis

### ** Examples


# Copy sample file to current wd
lnt_sample()

# Rename files in current wd and report back if successful
 ## Not run: 
##D report.df <- lnt_rename(recursive = FALSE,
##D                         report = TRUE)
## End(Not run)

# Or provide file name(s)
my_files<-list.files(pattern = ".txt", full.names = TRUE,
                     recursive = TRUE, ignore.case = TRUE)
report.df <- lnt_rename(x = my_files,
                        recursive = FALSE,
                        report = TRUE)

# Or provide folder name(s)
report.df <- lnt_rename(x = getwd())

report.df



