library(AmigaFFH)


### Name: packBitmap
### Title: A routine to (un)pack bitmap data
### Aliases: packBitmap unPackBitmap

### ** Examples

## generate some random raw data:
dat.rnd <- as.raw(sample.int(10, 100, TRUE))

## try to pack it:
pack.rnd <- packBitmap(dat.rnd)

## due to the random nature of the source data
## the data could not be packed efficiently.
## The length of the packed data is close to
## the length of the original data:
length(pack.rnd) - length(dat.rnd)

## Now generate similar data but sort it
## to generate more repetitive data:
dat.srt  <- as.raw(sort(sample.int(10, 100, TRUE)))
pack.srt <- packBitmap(dat.srt)

## This time the packing routing is more successful:
length(pack.srt) - length(dat.srt)

## The original data can always be obtained
## from the packed data:
all(dat.rnd == unPackBitmap(pack.rnd))
all(dat.srt == unPackBitmap(pack.srt))



