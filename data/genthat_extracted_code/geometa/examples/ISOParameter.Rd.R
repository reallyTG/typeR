library(geometa)


### Name: ISOParameter
### Title: ISOParameter
### Aliases: ISOParameter
### Keywords: ISO parameter

### ** Examples

  md <- ISOParameter$new()
  md$setName("name", "attType")
  md$setDirection("in")
  md$setDescription("description")
  md$setOptionality(FALSE)
  md$setRepeatability(FALSE)
  md$setValueType("CharacterString")  
  xml <- md$encode()




