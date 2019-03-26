library(qdapRegex)


### Name: rm_citation_tex
### Title: Remove/Replace/Extract LaTeX Citations
### Aliases: rm_citation_tex ex_citation_tex
### Keywords: bibkey citation

### ** Examples

x <- c(
    "I say \\parencite*{Ted2005, Moe1999} go there in \\textcite{Few2010} said to.",
    "But then \\authorcite{Ware2013} said it was so \\pcite[see][p. 22]{Get9999c}.", 
    "then I \\citep[p. 22]{Foo1882c} him")

rm_citation_tex(x)
rm_citation_tex(x, replacement="[[CITATION]]")
ex_citation_tex(x)



