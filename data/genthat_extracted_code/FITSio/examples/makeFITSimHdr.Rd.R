library(FITSio)


### Name: makeFITSimHdr
### Title: Generate header for FITS image
### Aliases: makeFITSimHdr
### Keywords: file

### ** Examples

X <- matrix(1:15, ncol = 3)
# extra header lines (optional)
header <- newKwv('KEYWORD', 'VALUE', 'NOTE') # initialize header
header <- addComment('Add these lines to auto-generated header', header=header)
header <- delKwv('KEYWORD', header=header)  # kill first line
header <- addKwv('test1', 'plot size', header=header)
header <- addKwv('test2', 4294.95397809807, 'number', header=header)
header <- addKwv('test3', 4.29495397809807e50, 'big number', header=header)
# make main header
header <- makeFITSimHdr(X, crpixn = c(1,1), crvaln = c(10, 100),
                        cdeltn = c(8, 2), ctypen = c("Distance", "Time"),
                        cunitn = c("Furlongs", "Fortnights"),
                        header = header)
# finish and close out header
tmp <- closeHdr(header) 



