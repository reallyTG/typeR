library(pals)


### Name: discrete
### Title: Discrete palettes
### Aliases: discrete alphabet alphabet2 cols25 glasbey kelly polychrome
###   stepped tableau20 tol watlington

### ** Examples


pal.bands(alphabet, alphabet2, cols25, glasbey, kelly, polychrome,
  stepped, tableau20, tol, watlington)

## Not run: 
##D alphabet()
##D alphabet()["jade"]
##D pal.bands(alphabet,n=26)
##D pal.heatmap(alphabet)
##D # pal.cube(alphabet)
##D 
##D pal.heatmap(alphabet2)
##D 
##D pal.heatmap(cols25)
##D 
##D pal.heatmap(glasbey(32))
##D # pal.cube(glasbey, n=32) # Blues are close together
##D 
##D pal.heatmap(kelly(22)) # too many orange/pink colors
##D 
##D pal.heatmap(polychrome)
##D 
##D pal.heatmap(stepped, n=24)
##D 
##D pal.heatmap(tol, 12)
##D 
##D pal.heatmap(watlington(16))
## End(Not run)




