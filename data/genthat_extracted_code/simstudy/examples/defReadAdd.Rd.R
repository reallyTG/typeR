library(simstudy)


### Name: defReadAdd
### Title: Read external csv data set definitions for adding columns
### Aliases: defReadAdd

### ** Examples

# Create temporary external "csv" files

test1 <- c("varname,formula,variance,dist,link",
           "nr,7, 0,nonrandom,identity"
          )

tfcsv1 <- tempfile()
writeLines(test1, tfcsv1)

test2 <- c("varname,formula,variance,dist,link",
           "x1,.4, 0,binary,identity",
           "y1,nr + x1 * 2,8,normal,identity",
           "y2,nr - 0.2 * x1,0,poisson, log"
          )

tfcsv2 <- tempfile()
writeLines(test2, tfcsv2)

# Generate data based on external definitions

defs <- defRead(tfcsv1)
dt <- genData(5, defs)
dt

# Add additional data based on external definitions

defs2 <- defReadAdd(tfcsv2)
dt <- addColumns(defs2, dt)
dt

unlink(tfcsv1)
unlink(tfcsv2)



