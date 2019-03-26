library(rdnb)


### Name: dnb_advanced
### Title: Search the DNB catalogue - advanced search
### Aliases: dnb_advanced

### ** Examples

## Not run: 
##D # german books titled with 'cat' (male or female), 
##D # excluding titles containing dogs, since the year 2001
##D cats <- dnb_advanced("(tit=katze OR tit=kater NOT tit=hund) AND jhr>2000 AND mat=books AND spr=ger")
## End(Not run)



