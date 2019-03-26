library(aqp)


### Name: munsell2rgb
### Title: Convert Munsell Notation to and from sRGB color coordinates
### Aliases: munsell2rgb rgb2munsell parseMunsell getClosestMunsellChip
### Keywords: manip

### ** Examples


# Munsell to sRGB triplets: 
# function is vectorized as long as arguments are the same length
color <- munsell2rgb(the_hue=c('10YR', '2.5YR'), the_value=c(3, 5), 
the_chroma=c(5, 6), return_triplets=TRUE)

# RGB triplets to closest Munsell color (in sRGB space)
# function is vectorized
rgb2munsell(color)

# neutral heues (N) map to approximate greyscale colors
# chroma may be any number or NA
g <- expand.grid(hue='N', value=2:8, chroma=NA, stringsAsFactors=FALSE)
munsell2rgb(g$hue, g$value, g$chroma)


# basic example: no factors!
d <- expand.grid(hue='10YR', value=2:8, chroma=1:8, stringsAsFactors=FALSE)
d$color <- with(d, munsell2rgb(hue, value, chroma))

# similar to the 10YR color book page
plot(value ~ chroma, data=d, col=d$color, pch=15, cex=3)

# multiple pages of hue:
hues <- c('2.5YR','5YR','7.5YR','10YR')
d <- expand.grid(hue=hues, value=2:8, chroma=seq(2,8,by=2), stringsAsFactors=FALSE)
d$color <- with(d, munsell2rgb(hue, value, chroma))


# plot: note that we are setting panel order from red-->yellow
library(lattice)
xyplot(value ~ factor(chroma) | factor(hue, levels=hues),
main="Common Soil Colors", layout=c(4,1), scales=list(alternating=1),
strip=strip.custom(bg=grey(0.85)),
data=d, as.table=TRUE, subscripts=TRUE, xlab='Chroma', ylab='Value',
panel=function(x, y, subscripts, ...)
{
panel.xyplot(x, y, pch=15, cex=4, col=d$color[subscripts])
}
)

# try again, this time annotate with LAB coordinates:
if(require(colorspace)) {
  d.rgb <- with(d, munsell2rgb(hue, value, chroma, return_triplets=TRUE))
  d.lab <- as(with(d.rgb, sRGB(r,g,b)), 'LAB')
  d <- data.frame(d, d.lab@coords)
  
  xyplot(value ~ factor(chroma) | factor(hue, levels=hues),
  main="Common Soil Colors - Annotated with LAB Coordinates", layout=c(4,1), 
  scales=list(alternating=1), strip=strip.custom(bg=grey(0.85)),
  data=d, as.table=TRUE, subscripts=TRUE, xlab='Chroma', ylab='Value',
  panel=function(x, y, subscripts, ...) {
    panel.xyplot(x, y, pch=15, cex=7, col=d$color[subscripts])
    lab.text <- with(d[subscripts, ], paste(round(L), round(A), round(B), sep='\n'))
    panel.text(x, y, labels=lab.text, cex=0.75, col='white', font=2)
    }
  )
  
  # also demonstrate A ~ hue for each slice of chroma
  xyplot(A ~ factor(hue, levels=hues) | factor(value), groups=chroma, data=d,
  scales=list(alternating=1), strip=strip.custom(bg=grey(0.85)),
  main="A-coordinate vs. Munsell Hue", sub='panels are Munsell value, colors are Munsell chroma',
  xlab='Munsell Hue', ylab='A-coordinate', pch=16,
  type='b', as.table=TRUE, auto.key=list(lines=TRUE, points=FALSE, columns=4))
  
  }



# soils example
data(sp1)

# convert colors
sp1$soil_color <- with(sp1, munsell2rgb(hue, value, chroma))

# simple plot, may need to tweak gamma-correction...
image(matrix(1:nrow(sp1)), axes=FALSE, col=sp1$soil_color, main='Soil Colors')

# convert into a more useful color space
# you will need the colorspace package for this to work
if(require(colorspace)) {
# keep RGB triplets from conversion
sp1.rgb <- with(sp1, munsell2rgb(hue, value, chroma, return_triplets=TRUE))

# convert into LAB color space
sp1.lab <- as(with(sp1.rgb, sRGB(r,g,b)), 'LAB')
plot(sp1.lab)
}

# convert a non-standard color to closest "chip" in `munsell` look-up table
getClosestMunsellChip('7.9YR 2.7/2.0', convertColors = FALSE)
# convert directly to R color
getClosestMunsellChip('7.9YR 2.7/2.0')



