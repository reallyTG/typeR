library(tsibble)


### Name: index_by
### Title: Group and collapse by time index
### Aliases: index_by

### ** Examples

# Monthly counts across sensors ----
monthly_ped <- pedestrian %>% 
  group_by(Sensor) %>% 
  index_by(Year_Month = yearmonth(Date_Time)) %>%
  summarise(
    Max_Count = max(Count),
    Min_Count = min(Count)
  )
monthly_ped
index(monthly_ped)

# Using existing variable ----
pedestrian %>% 
  group_by(Sensor) %>% 
  index_by(Date) %>%
  summarise(
    Max_Count = max(Count),
    Min_Count = min(Count)
  )

# Aggregate to 4-hour interval ---
pedestrian %>% 
  group_by(Sensor) %>% 
# convert to UTC for handling DST in floor_date(), since it does not respect tz
  mutate(Date_Time = lubridate::force_tz(Date_Time, tzone = "UTC")) %>% 
  index_by(Date_Time5 = lubridate::floor_date(Date_Time, "4 hour")) %>%
  summarise(Total_Count = sum(Count))

# Annual trips by Region and State ----
tourism %>% 
  index_by(Year = lubridate::year(Quarter)) %>% 
  group_by(Region, State) %>% 
  summarise(Total = sum(Trips))



