library(icdGLM)


### Name: expand_data
### Title: Complete incomplete data
### Aliases: expand_data

### ** Examples

data(TLI.data)
          expand_data(data = TLI.data[,1:3],
          y = TLI.data[,4],
          missing.x = 1:3,
          value.set = 0:1)



