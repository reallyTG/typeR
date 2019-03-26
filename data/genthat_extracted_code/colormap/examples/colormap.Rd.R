library(colormap)


### Name: colormap
### Title: A package to generate colors from a list of 44 pre-defined
###   palettes
### Aliases: colormap colormap-package

### ** Examples

colormap() # Defaults to 72 colors from the 'viridis' palette.
colormap(colormap=colormaps$temperature, nshades=20) # Diff Palette
colormap(colormap=c('#000000','#FF0000'), nshades=20) # Colormap as vector of colors
# list of list. Maximum flexibility
colormap(colormap=list(list(index=0,rgb=c(0,0,0)),list(index=1,rgb=c(255,255,255))), nshades=10)
colormap(format='rgb',nshades=10) # As rgb
colormap(format='rgb',nshades=10,alpha=0.5) # Constant alpha
colormap(format='rgbaString',nshades=10) # As rgba string



