library(diffobj)


### Name: auto_context
### Title: Configure Automatic Context Calculation
### Aliases: auto_context

### ** Examples

## `pager="off"` for CRAN compliance; you may omit in normal use
diffChr(letters, letters[-13], context=auto_context(0, 3), pager="off")
diffChr(letters, letters[-13], context=auto_context(0, 10), pager="off")
diffChr(
  letters, letters[-13], context=auto_context(0, 10), line.limit=3L,
  pager="off"
)



