library(FITSio)


### Name: parseHdr
### Title: Parse FITS header
### Aliases: parseHdr
### Keywords: files

### ** Examples

header <- newKwv('KEYWORD', 'VALUE', 'NOTE')
header <- addKwv('test1', 'plot size', header=header)
header <- addKwv('test2', 4294.95397809807, 'number', header=header)
header <- addKwv('test3', 4.29495397809807e50, 'big number', header=header)
header <- addKwv('test4', -4.29495397809807e50, 'big number', header=header)
parseHdr(header)



