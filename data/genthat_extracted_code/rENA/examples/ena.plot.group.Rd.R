library(rENA)


### Name: ena.plot.group
### Title: Plot of ENA set groups
### Aliases: ena.plot.group
### Keywords: ENA, group plot,

### ** Examples

data(RS.data)

codeNames = c('Data','Technical.Constraints','Performance.Parameters',
  'Client.and.Consultant.Requests','Design.Reasoning','Collaboration');

accum = ena.accumulate.data(
  units = RS.data[,c("UserName","Condition")],
  conversation = RS.data[,c("Condition","GroupName")],
  metadata = RS.data[,c("CONFIDENCE.Change","CONFIDENCE.Pre","CONFIDENCE.Post")],
  codes = RS.data[,codeNames],
  window.size.back = 4
)

set = ena.make.set(
  enadata = accum,
  rotation.by = ena.rotate.by.mean,
  rotation.params = list(
      accum$metadata$Condition=="FirstGame",
      accum$metadata$Condition=="SecondGame"
  )
)

plot = ena.plot(set)

unitNames = set$enadata$units

### Subset rotated points and plot Condition 1 Group Mean
first.game = unitNames$Condition == "FirstGame"
first.game.points = set$points.rotated[first.game,]
plot = ena.plot.group(plot, first.game.points, labels = "FirstGame",
    colors = "red", confidence.interval = "box")

### Subset rotated points and plot Condition 2 Group Mean
second.game = unitNames$Condition == "SecondGame"
second.game.points = set$points.rotated[second.game,]
plot = ena.plot.group(plot, second.game.points, labels = "SecondGame",
    colors  = "blue", confidence.interval = "box")

print(plot);




