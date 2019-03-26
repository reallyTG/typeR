library(Imap)


### Name: imap.ll
### Title: The Imap plotting function - usually called by imap()
### Aliases: imap.ll select.lines

### ** Examples

## Not run: 
##D 
##D ilines(list(npacific, select.lines(npacific)))  # Select one or more line seqments with left-click(s) and then a right-click to stop.
##D  
##D Africa <- select.lines(world.h.land) # Select the African polygon.
##D imap(zoom = FALSE)
##D imap(Africa, poly = 'purple', add = T, zoom = FALSE)
##D 
## End(Not run)



