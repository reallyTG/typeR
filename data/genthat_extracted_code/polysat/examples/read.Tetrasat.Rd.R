library(polysat)


### Name: read.Tetrasat
### Title: Read Data from a TETRASAT Input File
### Aliases: read.Tetrasat
### Keywords: file

### ** Examples

## Not run: 
##D # example from the Tetrasat website
##D mydata <- read.Tetrasat("http://markwith.freehomepage.com/sample.txt")
##D summary(mydata)
##D viewGenotypes(mydata, loci="A1_Gtype")
## End(Not run)

# example with defined data:
cat("Sample Data", "A1_Gtype", "A10_Gtype", "B1_Gtype", "D7_Gtype",
"D9_Gtype", "D12_Gtype", "Pop",
"BCRHE 1             0406     04040404 0208     02020202 03030303 0710",
"BCRHE 10            0406     04040404 07070707 02020202 0304     0710",
"BCRHE 2             04040404 04040404 0708     02020202 010305   0710",
"BCRHE 3             04040404 04040404 02020202 0203     03030303 0809",
"BCRHE 4             04040404 04040404 0608     0203     03030303 070910",
"BCRHE 5             04040404 04040404 0208     02020202 03030303 050710",
"BCRHE 6             0304     04040404 0207     02020202 03030303 07070707",
"BCRHE 7             0406     04040404 0708     02020202 03030303 07070707",
"BCRHE 8             0304     04040404 0203     0203     03030303 0709",
"BCRHE 9             0406     04040404 0708     02020202 03030303 0710",
"Pop",
"BR 1                0406     04040404 05050505 02020202 03030303 1012",
"BR 10               030406   04040404 0607     02020202 03030303 1011",
"BR 2                030406   04040404 07070707 02020202 03030303 09090909",
"BR 3                010304   04040404 07070707 02020202 03030303 09090909",
"BR 4                030406   04040404 07070707 0203     03030303 10101010",
"BR 5                030406   04040404 07070707 02020202 03030303 10101010",
"BR 6                0406     04040404 0507     0203     03030303 10101010",
"BR 7                0304     04040404 0809     02020202 03030303 070910",
"BR 8                030406   04040404 07070707 02020202 03030303 070910",
"BR 9                0406     04040404 07070707 02020202 03030303 07070707",
sep="\n", file="TetrasatExample.txt")
mydata2 <- read.Tetrasat("TetrasatExample.txt")

summary(mydata2)
viewGenotypes(mydata2, loci="B1_Gtype")



