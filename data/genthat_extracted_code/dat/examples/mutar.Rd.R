library(dat)


### Name: mutar
### Title: Tools for Data Frames
### Aliases: mutar filtar sumar

### ** Examples

data("airquality")
airquality %>%
  filtar(~Month > 4) %>%
  mutar(meanWind ~ mean(Wind), by = "Month") %>%
  sumar(meanWind ~ mean(Wind), by = "Month") %>%
  extract("meanWind")

airquality %>%
  sumar(
    FL(.n ~ mean(.n), .n = c("Wind", "Temp")),
    by = "Month"
  )



