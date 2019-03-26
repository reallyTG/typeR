library(unitizer)


### Name: unitizer_sect
### Title: Define a 'unitizer' Section
### Aliases: unitizer_sect

### ** Examples

unitizer_sect("Switch to `all.equal` instead of `all_eq`",
  {
    fun(6L)
    fun("hello")
  },
  compare=testFuns(value=all.equal, conditions=all.equal)
)
unitizer_sect("Use identical for ALL test data, including stdout, etc.",
  {
    fun(6L)
    fun("hello")
  },
  compare=identical
)



