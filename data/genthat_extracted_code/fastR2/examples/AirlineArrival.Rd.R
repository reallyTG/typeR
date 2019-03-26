library(fastR2)


### Name: AirlineArrival
### Title: Airline On-Time Arrival Data
### Aliases: AirlineArrival
### Keywords: datasets

### ** Examples


tally(
  airline ~ result, data = AirlineArrival, 
  format = "perc", margins = TRUE)
tally(
  result ~ airline + airport, 
  data = AirlineArrival, format = "perc", margins = TRUE)
AirlineArrival2 <- 
  AirlineArrival %>% 
  group_by(airport, airline, result) %>% 
  summarise(count = n()) %>%
  group_by(airport, airline) %>%
  mutate(total = sum(count), percent = count/total * 100) %>% 
  filter(result == "Delayed") 
AirlineArrival3 <- 
  AirlineArrival %>% 
  group_by(airline, result) %>% 
  summarise(count = n()) %>%
  group_by(airline) %>%
  mutate(total = sum(count), percent = count/total * 100) %>% 
  filter(result == "Delayed") 
  gf_line(percent ~ airport, color = ~ airline, group = ~ airline, 
          data = AirlineArrival2) %>%
    gf_point(percent ~ airport, color = ~ airline, size = ~total, 
             data = AirlineArrival2) %>%
    gf_hline(yintercept = ~ percent, color = ~airline, 
             data = AirlineArrival3, linetype = "dashed") %>%
    gf_labs(y = "percent delayed") 



