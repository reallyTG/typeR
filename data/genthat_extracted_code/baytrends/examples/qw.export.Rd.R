library(baytrends)


### Name: qw.export
### Title: qw.export
### Aliases: qw.export

### ** Examples

# define data frame with qw column classes
myDF <- dataCensored

# directory to save output
dir.save <- getwd()

# prefix for file names ()
fn.out <- "dataCensored_TEST.csv" 

# run function
qw.export(myDF, dir.save, fn.out)



