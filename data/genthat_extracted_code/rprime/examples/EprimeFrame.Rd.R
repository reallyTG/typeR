library(rprime)


### Name: EprimeFrame
### Title: Create an EprimeFrame object
### Aliases: EprimeFrame

### ** Examples

# Default metadata values
lines <- c(
  "key: value",
  "question: answer",
  "garbage text")

EprimeFrame(lines)
# List of 8
# $ Eprime.Level      : num 1
# $ Eprime.LevelName  : logi NA
# $ Eprime.Basename   : logi NA
# $ Eprime.FrameNumber: logi NA
# $ Procedure         : logi NA
# $ Running           : logi NA
# $ key               : chr "value"
# $ question          : chr "answer"

# Normalize [Running] related lines
keys_values <- c(
  "Running: Demo",
  "Demo: ExampleCode",
  "Demo.Cycle: 1",
  "Demo.Sample: 1",
  "Key: Value")

EprimeFrame(keys_values)
# List of 9
# $ Eprime.Level      : num 1
# $ Eprime.LevelName  : chr "Demo_ExampleCode"
# $ Eprime.Basename   : logi NA
# $ Eprime.FrameNumber: logi NA
# $ Procedure         : logi NA
# $ Running           : chr "Demo"
# $ Cycle             : chr "1"
# $ Sample            : chr "1"
# $ Key               : chr "Value"



