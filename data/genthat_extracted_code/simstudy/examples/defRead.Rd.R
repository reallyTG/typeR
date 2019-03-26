library(simstudy)


### Name: defRead
### Title: Read external csv data set definitions
### Aliases: defRead

### ** Examples

# Create temporary external "csv" file

test1 <- c("varname,formula,variance,dist,link",
           "nr,7, 0,nonrandom,identity",
           "x1,.4, 0,binary,identity",
           "y1,nr + x1 * 2,8,normal,identity",
           "y2,nr - 0.2 * x1,0,poisson, log"
          )

tfcsv <- tempfile()
writeLines(test1, tfcsv)

# Read external csv file stored in file "tfcsv"

defs <- defRead(tfcsv, id = "myID")
defs

unlink(tfcsv)

# Generate data based on external definition

genData(5, defs)



