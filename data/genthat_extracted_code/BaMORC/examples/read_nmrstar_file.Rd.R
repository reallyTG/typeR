library(BaMORC)


### Name: read_nmrstar_file
### Title: Extracts data from BMRB STAR 3.0 file. 'read_nmrstar_file()'
###   parses BMRB STAR 3.0 file. It will extract sequence information and
###   chemical shifts for both alpha and beta carbons.
### Aliases: read_nmrstar_file

### ** Examples

## Download a BMRB file
library(BMRBr)
## Not run: bmrb_download(id_list = "4020", output_dir = "./", verbose = F)

## Read in BMRB file and procec
file_path = "bmr4020.str"
## Not run: head(read_nmrstar_file(file_path)

## Delete downloaded BMRB file
## Not run: unlink("./bmr4020.str")




