library(encode)


### Name: encode
### Title: Encode Factor-like Levels and Labels as a Simple String
### Aliases: encode

### ** Examples


a <- encode(
  x = list(
    c('M','F'),
    c(1:4)
  ),
  labels = list(
    c('male','female'),
    c('caucasian','asian','african',NA)
  )
)
b <- encode(c(1:2),c('pediatric','adult'))
a
b
c <- c('a',NA,'##b##')
encoded(a)
encoded(b)
encoded(c)
encoded(' //4// ')
codes(a)
codes(b)
codes(b,simplify=FALSE)
codes(c)
codes('..1..')
decodes(a)
decodes(b)
decodes(c)
decode(1:4,'//1/a//2/b//3/c//')
decode(1:4,'//1/a//1/b//3/c//') # duplicate code: ignored
decode(1:4,'//1/a//2/a//3/c//') # duplicate decode: collapsed
# encode(c(1,1,2,3),c('a','b','c','d')) Warning: duplicate codes

## Don't show: 
stopifnot(encoded('////'))
stopifnot(encoded('//a///'))
stopifnot(!encoded('///a//')) 
stopifnot(!encoded('//a/a//b/b///')) 
stopifnot(identical(decode(1:4),factor(1:4)))
## End(Don't show)



