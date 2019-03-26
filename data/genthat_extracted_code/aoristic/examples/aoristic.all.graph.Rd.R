library(aoristic)


### Name: aoristic.all.graph
### Title: Creating a data frame for an aoristic graph using all data
### Aliases: aoristic.all.graph

### ** Examples

## No test: 
data(aoristic)
data <- aoristic.df(data=arlington,
         DateTimeFrom="DateTimeFrom", DateTimeTo="DateTimeTo")
graph <- aoristic.all.graph(data=data)
ggplot(graph, aes(x=hour, y=freq)) +
   geom_bar(stat="identity") +
   ggtitle("Aoristic Graph for the Entire Study Area")

# with probability labels
graph$prob <- paste(round(graph$freq / sum(graph$freq) * 100, 1), "%", sep="")
ggplot(graph, aes(x=hour, y=freq)) +
   geom_bar(stat="identity") +
   ggtitle("Aoristic Graph for the Entire Study Area") +
   geom_text(aes(y=freq, label=prob), vjust=1.5, colour="white", size=4)

## End(No test)



