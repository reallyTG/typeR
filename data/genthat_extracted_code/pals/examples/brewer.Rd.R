library(pals)


### Name: brewer
### Title: ColorBrewer palettes
### Aliases: brewer brewer.blues brewer.bugn brewer.bupu brewer.gnbu
###   brewer.greens brewer.greys brewer.oranges brewer.orrd brewer.pubu
###   brewer.pubugn brewer.purd brewer.purples brewer.rdpu brewer.reds
###   brewer.ylgn brewer.ylgnbu brewer.ylorbr brewer.ylorrd brewer.brbg
###   brewer.piyg brewer.prgn brewer.puor brewer.rdbu brewer.rdgy
###   brewer.rdylbu brewer.rdylgn brewer.spectral brewer.accent
###   brewer.dark2 brewer.paired brewer.pastel1 brewer.pastel2 brewer.set1
###   brewer.set2 brewer.set3

### ** Examples


# Sequential
pal.bands(brewer.blues, brewer.bugn, brewer.bupu, brewer.gnbu, brewer.greens,
          brewer.greys, brewer.oranges, brewer.orrd, brewer.pubu, brewer.pubugn,
          brewer.purd, brewer.purples, brewer.rdpu, brewer.reds, brewer.ylgn,
          brewer.ylgnbu, brewer.ylorbr, brewer.ylorrd)

# Diverging
pal.bands(brewer.brbg, brewer.piyg, brewer.prgn, brewer.puor, brewer.rdbu,
          brewer.rdgy, brewer.rdylbu, brewer.rdylgn, brewer.spectral)

# Qualtitative
pal.bands(brewer.accent(8), brewer.dark2(8), brewer.paired(12), brewer.pastel1(9),
          brewer.pastel2(8), brewer.set1(9), brewer.set2(8), brewer.set3(10),
          labels=c("brewer.accent", "brewer.dark2", "brewer.paired", "brewer.pastel1",
          "brewer.pastel2", "brewer.set1", "brewer.set2", "brewer.set3"))

## Not run: 
##D 
##D # Sequential
##D pal.test(brewer.blues)
##D pal.test(brewer.bugn)
##D pal.test(brewer.bupu)
##D pal.test(brewer.gnbu)
##D pal.test(brewer.greens)
##D pal.test(brewer.greys)
##D pal.test(brewer.oranges)
##D pal.test(brewer.orrd) 
##D pal.test(brewer.pubu) # good
##D pal.test(brewer.pubugn) # good
##D pal.test(brewer.purd)
##D pal.test(brewer.purples)
##D pal.test(brewer.rdpu)
##D pal.test(brewer.reds)
##D pal.test(brewer.ylgn)
##D pal.test(brewer.ylgnbu)
##D pal.test(brewer.ylorbr)
##D pal.test(brewer.ylorrd)
##D 
##D # Diverging, max n=11 colors
##D pal.test(brewer.brbg)
##D pal.test(brewer.piyg)
##D pal.test(brewer.prgn)
##D pal.test(brewer.puor)
##D pal.test(brewer.rdbu)
##D pal.test(brewer.rdgy)
##D pal.test(brewer.rdylbu)
##D pal.test(brewer.rdylgn)
##D pal.test(brewer.spectral)
##D 
##D # Qualtitative. These are weird...don't do this
##D pal.test(brewer.accent)
##D pal.test(brewer.dark2)
##D pal.test(brewer.paired)
##D pal.test(brewer.pastel1)
##D pal.test(brewer.pastel2)
##D pal.test(brewer.set1)
##D pal.test(brewer.set2)
##D pal.test(brewer.set3)
##D 
##D # Need to move these to 'tests'         
##D pal.bands(brewer.accent(3), brewer.accent(4), brewer.accent(5), brewer.accent(6),
##D           brewer.accent(7), brewer.accent(8), brewer.accent(9), brewer.accent(10),
##D           brewer.accent(11), brewer.accent(12))
##D #brewer.purd(1) # Should err
##D #brewer.purd(2) # Should err
##D brewer.purd(3)
##D brewer.purd(9)
##D brewer.purd(25)
##D pal.bands(brewer.purd(3), brewer.purd(4), brewer.purd(5), brewer.purd(6),
##D           brewer.purd(7), brewer.purd(8), brewer.purd(9), brewer.purd(10),
##D           brewer.purd(11), brewer.purd(12), brewer.purd(13), brewer.purd(14),
##D           brewer.purd(15), brewer.purd(100))
## End(Not run)




