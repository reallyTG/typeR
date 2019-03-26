library(rio)


### Name: convert
### Title: Convert from one file format to another
### Aliases: convert

### ** Examples

# create a file to convert
export(mtcars, "mtcars.dta")

# convert Stata to CSV and open converted file
convert("mtcars.dta", "mtcars.csv")
head(import("mtcars.csv"))

# correct an erroneous file format
export(mtcars, "mtcars.csv", format = "tsv")
convert("mtcars.csv", "mtcars.csv", in_opts = list(format = "tsv"))

# convert serialized R data.frame to JSON
export(mtcars, "mtcars.rds")
convert("mtcars.rds", "mtcars.json")

# cleanup
unlink("mtcars.csv")
unlink("mtcars.dta")
unlink("mtcars.rds")
unlink("mtcars.json")

## Not run: 
##D # convert from the command line:
##D Rscript -e "rio::convert('mtcars.dta', 'mtcars.csv')"
## End(Not run)



