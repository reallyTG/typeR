library(RRNA)


### Name: pseudoKnot
### Title: removes pseudoknots from a ct file
### Aliases: pseudoKnot
### Keywords: pseudoknot RNA

### ** Examples

pk=makeCt("((((...(((((((.........)))))))...((((.........))))...))))",
          "AAAAAAAACCCCCCCCAAAGGGGGGGAUUACCCCUCCUUUAAAAGGGUUUUCCCCCCC")
pk$bound[pk$pos==20]=42
pk$bound[pk$pos==19]=43
pk$bound[pk$pos==43]=19
pk$bound[pk$pos==42]=20

l=pseudoKnot(pk)

## Positions of removed pseudo knots ##
removed=l[[1]]

### clean ct file that can be used by ct2coord ###
ct=l[[2]]





