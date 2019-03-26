library(RRNA)


### Name: ct2coord
### Title: Generate coordinate file
### Aliases: ct2coord
### Keywords: coordinate rna

### ** Examples

ct=makeCt("((((...(((((((....)))))))...((((...))))...))))",
          "CCCCAAAGGGGGGGAUUACCCCUCCUUUAAAAGGGUUUUCCCCCCC"
         )
coord=ct2coord(ct)
RNAPlot(coord)



