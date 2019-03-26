library(pandocfilters)


### Name: Cite
### Title: Citation
### Aliases: Cite

### ** Examples

ci <- Citation(suffix=list(Str("Suffix_1")),
               id="Citation_ID_1", prefix=list(Str("Prefix_1")))
Cite(ci, Str("some text"))



