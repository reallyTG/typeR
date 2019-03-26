library(googleVis)


### Name: gvisCalendar
### Title: Google Calendar Chart with R
### Aliases: gvisCalendar
### Keywords: iplot

### ** Examples

cl1 <- gvisCalendar(Cairo, datevar="Date", numvar="Temp")
plot(cl1)

## Not all months shown? 
## We can change the setting of the width ...

cl2 <- gvisCalendar(Cairo, datevar="Date", numvar="Temp",
                    options=list(width=1000))
plot(cl2)

## ... or the cell size
cl3 <- gvisCalendar(Cairo, datevar="Date", 
                    numvar="Temp", 
                    options=list(calendar="{ cellSize: 10 }"))
plot(cl3)

## Example with many options set
cl4 <- gvisCalendar(Cairo, datevar="Date", numvar="Temp",
                    options=list(
                    title="Daily temperature in Cairo",
                    height=320,
                    calendar="{yearLabel: { fontName: 'Times-Roman',
                               fontSize: 32, color: '#1A8763', bold: true},
                               cellSize: 10,
                               cellColor: { stroke: 'red', strokeOpacity: 0.2 },
                               focusedCellColor: {stroke:'red'}}")
                  )
plot(cl4)




