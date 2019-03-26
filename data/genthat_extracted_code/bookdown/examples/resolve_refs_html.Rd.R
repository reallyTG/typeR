library(bookdown)


### Name: resolve_refs_html
### Title: Resolve figure/table/section references in HTML
### Aliases: resolve_refs_html
### Keywords: internal

### ** Examples

library(bookdown)
resolve_refs_html(c("<caption>(#tab:foo) A nice table.</caption>", 
    "<p>See Table @ref(tab:foo).</p>"), TRUE)



