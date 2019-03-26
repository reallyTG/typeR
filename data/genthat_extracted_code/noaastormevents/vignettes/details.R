## ----echo = FALSE--------------------------------------------------------
not_cran <- Sys.getenv("NOT_CRAN") == "true"
hasData <- requireNamespace("hurricaneexposuredata", quietly=TRUE)
if (!not_cran | !hasData) {
    knitr::opts_chunk$set(eval = FALSE)
    msg <- paste("Note: Examples in this vignette are set to not run on CRAN. If you would",
                 "like to build this vignette locally, you can do so by first setting the",
                 "environmental variable 'NOT_CRAN' to 'true' on your computer and then ",
                 "rebuilding the vignette.")
    msg <- paste(strwrap(msg), collapse="\n")
    message(msg)
}

## ----echo = FALSE, message = FALSE, warning = FALSE----------------------
library(ggplot2)
library(stringr)
library(lubridate)
library(forcats)
library(dplyr)
library(tidyr)
library(viridis)

library(noaastormevents)

## ----echo = FALSE, fig.width = 6, fig.height = 4, fig.align = "center"----
url <- paste0("http://www1.ncdc.noaa.gov/pub/data/swdi/",
                "stormevents/csvfiles/")
times_translation <- data_frame(times = c("K", "M", "G"),
                                times_num = c(10^3, 10^6, 10^9))
htmltab::htmltab(doc = url, which = 1, rm_nodata_cols = FALSE) %>%
  select(Name, Size) %>%
  filter(!(Size %in% "-")) %>%
  mutate(file_type = str_extract(Name, ".*?-ftp"),
         file_type = str_replace(file_type, "StormEvents_", ""),
         file_type = str_replace(file_type, "-ftp", ""),
         base = str_extract(Size, "[0-9.]+"),
         times = str_extract(Size, "[A-Z]")) %>%
  filter(file_type %in% c("details", "fatalities", "locations")) %>%
  mutate(year = str_extract(Name, "_d[0-9]{1,4}_"),
         year = str_extract(year, "[0-9]+"),
         year = as.numeric(year)) %>%
  select(file_type, base, times, year) %>%
  left_join(times_translation, by = "times") %>%
  mutate(base = as.numeric(base),
         times_num = ifelse(is.na(times_num), 1, times_num),
         file_size = base * times_num,
         file_type = str_to_title(file_type)) %>%
  select(-base, -times, -times_num) %>%
  ggplot(aes(x = year, y = file_size, color = file_type)) + 
  geom_hline(aes(yintercept = 10^3), lty = 2, col = "lightgray") + 
  annotate("text", x = 1952, y = 10^3 + 500, label = "1 KB") + 
  geom_hline(aes(yintercept = 10^6), lty = 2, col = "lightgray") + 
  annotate("text", x = 1952, y = 10^6 + 500000, label = "1 MB") + 
  geom_vline(aes(xintercept = 1996), lty = 3) + 
  geom_line() + 
  theme_classic() + 
  labs(x = "Year", y = "File size", color = "File type") +
  scale_y_log10()

## ------------------------------------------------------------------------
find_file_name(year = "1999", file_type = "detail")

## ------------------------------------------------------------------------
find_file_name

## ------------------------------------------------------------------------
noaastormevents:::download_storm_data

## ------------------------------------------------------------------------
create_storm_data

## ----echo = FALSE--------------------------------------------------------
library(hurricaneexposuredata)
library(hurricaneexposure)

hurr_tracks %>%
        select(storm_id) %>%
        distinct() %>%
        separate(storm_id, into = c("storm_name", "Year"), sep = "-") %>%
        group_by(Year) %>%
        summarize(Storms = paste(storm_name, collapse = ", ")) %>% 
        as.data.frame() %>% 
        pander::pander(justify = "cl", split.cells = c("20%","80%"))

## ----message = FALSE-----------------------------------------------------
events_2015 <- create_storm_data(date_range = c("2015-01-01", "2015-12-31"))
slice(events_2015, 1:3)

## ----echo = FALSE--------------------------------------------------------
events_2015 %>%
  group_by(EVENT_TYPE) %>%
  summarize(N = n()) %>%
  arrange(desc(N)) %>%
  mutate(N = prettyNum(N, big.mark = ",")) %>%
  knitr::kable(col.names = c("Event type", "Number of events in 2015"))

## ----fig.width = 8, fig.height = 8, echo = FALSE, fig.align = "center"----
events_2015 %>%
  select(BEGIN_DATE_TIME, EVENT_TYPE) %>%
  mutate(date = str_extract(BEGIN_DATE_TIME, ".+\\ "),
         date = dmy(date)) %>%
  group_by(date, EVENT_TYPE) %>%
  summarize(n = n()) %>%
  ungroup() %>%
  group_by(EVENT_TYPE) %>%
  mutate(tot_n = sum(n)) %>%
  ungroup() %>%
  arrange(desc(tot_n)) %>%
  mutate(EVENT_TYPE = factor(EVENT_TYPE, levels = unique(EVENT_TYPE))) %>%
  ggplot(aes(x = date, y = n)) + 
  geom_point(alpha = 0.3, size = 1) + 
  facet_wrap(~ EVENT_TYPE, scales = "free_y", ncol = 5) + 
  scale_x_date(date_labels = "%m/%d", date_breaks = "4 months") + 
  theme_classic()

## ----fig.height = 3.5, fig.width = 5, echo = FALSE, fig.align = "center"----
events_2015 %>%
  mutate(date = substring(BEGIN_DATE_TIME, 1, 9),
         date = dmy(date),
         yday = yday(date)) %>%
  group_by(EPISODE_ID) %>%
  summarize(n = n(),
            day_diff = max(yday) - min(yday)) %>%
  ggplot(aes(x = n, y = day_diff)) +
  geom_jitter(height = 0.1, alpha = 0.25) + 
  theme_classic() + 
  labs(x = "Number of events per episode", 
       y = "Largest difference in begin dates\nacross events in the episode")

## ------------------------------------------------------------------------
events_2015 %>% 
  select(EPISODE_ID, STATE) %>% 
  group_by(EPISODE_ID) %>% 
  summarize(n_states = length(unique(STATE))) %>% 
  ungroup() %>% 
  summarize(max_n_states = max(n_states))

## ----message = FALSE, warning = FALSE, echo = FALSE, fig.align = "center", fig.width = 6, fig.height = 10----
top_episodes <- events_2015 %>%
  group_by(EPISODE_ID) %>%
  summarize(n = n()) %>%
  arrange(desc(n)) %>%
  slice(1:10)

events_2015 %>%
  filter(EPISODE_ID %in% top_episodes$EPISODE_ID) %>%
  mutate(EPISODE_ID = factor(EPISODE_ID, levels = unique(top_episodes$EPISODE_ID))) %>%
  ggplot(aes(x = BEGIN_LON, y = BEGIN_LAT)) +  
  geom_polygon(data= map_data("state"),
               aes(x = long, y = lat, group = group),
               colour = "black", fill = NA) + 
  geom_point(color = "red", alpha = 0.3, size = 0.5) + 
  facet_wrap(~ EPISODE_ID, ncol = 2) +
  coord_map() + 
  theme_void()

## ----echo = FALSE, fig.align = "center", fig.width = 6, fig.height = 4----
top_episodes <- events_2015 %>%
  group_by(EPISODE_ID) %>%
  summarize(n = n()) %>%
  arrange(desc(n)) %>%
  slice(1:10)

a <- events_2015 %>%
  filter(EPISODE_ID %in% top_episodes$EPISODE_ID) %>%
  group_by(EPISODE_ID, EVENT_TYPE) %>%
  summarize(n = n()) %>%
  ungroup() %>%
  spread(key = EPISODE_ID, value = n, fill = 0) %>%
  tibble::remove_rownames() %>%
  as.data.frame() %>%
  tibble::column_to_rownames(var = "EVENT_TYPE") %>%
  dist("canberra") %>%
  hclust() 

## ----echo = FALSE, fig.align = "center", fig.width = 6, fig.height = 3.5----
events_2015 %>%
  filter(EPISODE_ID %in% top_episodes$EPISODE_ID) %>%
  group_by(EPISODE_ID, EVENT_TYPE) %>%
  summarize(n = n()) %>%
  ungroup() %>%
  mutate(EPISODE_ID = factor(EPISODE_ID, levels = unique(top_episodes$EPISODE_ID)),
         EVENT_TYPE = factor(EVENT_TYPE, levels = unique(a$labels[a$order]))) %>%
  ggplot(aes(x = EPISODE_ID, y = EVENT_TYPE)) + 
  geom_tile(aes(fill = n)) + 
  theme_classic() + 
  labs(x = "", y = "", fill = "Number of events reported") + 
  theme(axis.text.x  = element_text(angle=45, vjust = 1, hjust = 0),
        legend.position = "top",
        plot.margin = unit(c(0, 1, 0, 0), "cm")) +
  scale_x_discrete(position = "top") +
  scale_fill_viridis(option = "A", direction = -1)

## ----echo = FALSE, fig.align = "center", fig.width = 6, fig.height = 10----
b <- events_2015 %>%
  group_by(EVENT_TYPE) %>%
  mutate(n_events = n()) %>%
  ungroup() %>%
  filter(n_events >= 50) %>%
  group_by(EPISODE_ID, EVENT_TYPE) %>%
  summarize(n = n()) %>%
  ungroup() %>%
  spread(key = EPISODE_ID, value = n, fill = 0) %>%
  tibble::remove_rownames() %>%
  as.data.frame() %>%
  tibble::column_to_rownames(var = "EVENT_TYPE") %>%
  dist("canberra") %>%
  hclust() 
plot(as.dendrogram(b, hang = 0.25), horiz = TRUE, axes = FALSE)

## ----echo = FALSE, fig.height = 6, fig.width = 8, fig.align = "center"----
events_2015 %>%
  group_by(EVENT_TYPE) %>%
  mutate(n_events = n()) %>%
  ungroup() %>%
  filter(n_events >= 100) %>%
  group_by(EPISODE_ID, EVENT_TYPE) %>%
  summarize(n = n()) %>%
  ungroup() %>%
  mutate(EPISODE_ID = factor(EPISODE_ID),
         EVENT_TYPE = factor(EVENT_TYPE, levels = unique(b$labels[b$order]))) %>%
  ggplot(aes(x = EVENT_TYPE, y = EPISODE_ID)) + 
  geom_tile(aes(fill = n)) + 
  theme_classic() + 
  theme(axis.text.x  = element_text(angle = 45, vjust = 1, hjust = 0),
        legend.position = "top",
        plot.margin = unit(c(0, 1, 0, 0), "cm"),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()) +
  scale_x_discrete(position = "top") +
  scale_fill_viridis(option = "A", direction = -1, begin = 0.1, end = 0.9) + 
  labs(x = "", y = "", fill = "Number of reported events in the episode")

## ----echo = FALSE--------------------------------------------------------
events_2015 %>%
  group_by(SOURCE) %>%
  summarize(N = n()) %>%
  arrange(desc(N)) %>%
  mutate(N = prettyNum(N, big.mark = ",")) %>%
  knitr::kable(col.names = c("Source of event report", "Number of events reported in 2015"))

## ----fig.height = 7, fig.width = 10, echo = FALSE, message = FALSE, warning = FALSE, fig.align = "center"----
tot_events <- events_2015 %>%
  group_by(EVENT_TYPE) %>%
  summarize(tot_events = n()) %>%
  arrange(desc(tot_events))
tot_source <- events_2015 %>%
  group_by(SOURCE) %>%
  summarize(tot_source = n()) %>%
  arrange(tot_source)

events_2015 %>%
  group_by(EVENT_TYPE, SOURCE) %>%
  summarize(N = n()) %>%
  ungroup() %>%
  right_join(tot_events, by = "EVENT_TYPE") %>%
  mutate(perc_events = 100 * N / tot_events) %>%
  mutate(EVENT_TYPE = factor(EVENT_TYPE, levels = unique(EVENT_TYPE)),
         SOURCE = factor(SOURCE, levels = unique(tot_source$SOURCE))) %>%
  ggplot(aes(y = SOURCE, x = EVENT_TYPE)) + 
  geom_tile(aes(fill = perc_events)) + 
  theme_classic() + 
  labs(x = "", y = "", fill = "% events reported by a given source") + 
  theme(axis.text.x  = element_text(angle=45, vjust = 1, hjust = 0),
        legend.position = "top",
        plot.margin = unit(c(0, 1, 0, 0), "cm")) +
  scale_x_discrete(position = "top") +
  scale_fill_viridis(option = "C", direction = -1)

## ----echo = FALSE, fig.height = 8, fig.width = 6, fig.align = "centers"----
events_2015 %>%
  group_by(STATE) %>%
  summarize(n = n()) %>%
  mutate(STATE = str_to_title(STATE)) %>%
  ggplot(aes(x = n, y = fct_reorder(STATE, n))) + 
  geom_point() + 
  labs(x = "Number of listed events in 2015", y = "") + 
  theme_classic()

## ----echo = FALSE--------------------------------------------------------
events_2015 %>%
  group_by(EVENT_TYPE) %>%
  summarize(n = n(),
            non_miss = sum(!is.na(BEGIN_LAT)),
            perc_non_miss = non_miss / n,
            perc_non_miss = factor(perc_non_miss, levels = c(1, 0),
                                   labels = c("With latitude / longitude",
                                              "Without latitude / longitude"))) %>%
  ungroup() %>%
  group_by(perc_non_miss) %>%
  summarize(with_loc = paste(EVENT_TYPE, collapse = ", ")) %>%
  rename(` ` = perc_non_miss, 
         `Event types` = with_loc) %>%
  as.data.frame() %>% 
  pander::pander(split.cells = c(20, 60),
                 justify = "rl")

## ----echo = FALSE, fig.width = 9, fig.height = 6, fig.align = "center"----
events_2015 %>%
  filter(!is.na(BEGIN_LAT) & !(is.na(BEGIN_LON))) %>%
  filter(!(STATE %in% c("GULF OF MEXICO", "ALASKA", "GUAM", "ATLANTIC NORTH",
                        "LAKE HURON", "LAKE ST CLAIR", "HAWAII", "AMERICAN SAMOA",
                        "LAKE SUPERIOR", "ATLANTIC SOUTH", "LAKE MICHIGAN", 
                        "HAWAII WATERS", "PUERTO RICO", "E PACIFIC", "LAKE ERIE",
                        "LAKE ONTARIO", "VIRGIN ISLANDS"))) %>%
  mutate(MONTH_NAME = factor(MONTH_NAME, levels = month.name)) %>%
  ggplot(aes(x = BEGIN_LON, y = BEGIN_LAT)) + 
  geom_polygon(data = map_data("usa"), aes(x = long, y = lat, group = group),
               color = "black", fill = NA) + 
  geom_point(size = 1, alpha = 0.15, color = "darkred") + 
  coord_map() + 
  theme_void() + 
  facet_wrap(~ MONTH_NAME)

## ----echo = FALSE, fig.width = 9, fig.height = 6, fig.align = "center"----
events_2015 %>%
  filter(!is.na(BEGIN_LAT) & !(is.na(BEGIN_LON))) %>%
  filter(!(STATE %in% c("GULF OF MEXICO", "ALASKA", "GUAM", "ATLANTIC NORTH",
                        "LAKE HURON", "LAKE ST CLAIR", "HAWAII", "AMERICAN SAMOA",
                        "LAKE SUPERIOR", "ATLANTIC SOUTH", "LAKE MICHIGAN", 
                        "HAWAII WATERS", "PUERTO RICO", "E PACIFIC", "LAKE ERIE",
                        "LAKE ONTARIO", "VIRGIN ISLANDS"))) %>%
  group_by(EVENT_TYPE) %>%
  mutate(n = n()) %>%
  ungroup() %>%
  mutate(EVENT_TYPE = fct_reorder(EVENT_TYPE, n, .desc = TRUE)) %>%
  ggplot(aes(x = BEGIN_LON, y = BEGIN_LAT)) + 
  geom_polygon(data = map_data("usa"), aes(x = long, y = lat, group = group),
               color = "black", fill = NA) + 
  geom_point(size = 0.8, alpha = 0.15, color = "darkred") + 
  coord_map() + 
  theme_void() + 
  facet_wrap(~ EVENT_TYPE)

## ----echo = FALSE, fig.width = 7, fig.height = 5, fig.align = "center"----
events_2015 %>%
  filter(!is.na(BEGIN_LAT) & !(is.na(BEGIN_LON)) & 
        !is.na(END_LAT) & !(is.na(END_LON))) %>%
  mutate(diff_lon = BEGIN_LON - END_LON,
         diff_lat = BEGIN_LAT - END_LAT) %>%
  filter(abs(diff_lon) > 0.1 | abs(diff_lat) > 0.1) %>%
  filter(STATE == "ARKANSAS") %>%
  ggplot(aes(x = BEGIN_LON, y = BEGIN_LAT)) + 
  geom_polygon(data = map_data("county", region = "arkansas"), 
               aes(x = long, y = lat, group = group),
               color = "lightgray", fill = NA) + 
  geom_polygon(data = map_data("state", region = "arkansas"),
               aes(x = long, y = lat, group = group),
                   color = "black", fill = NA) + 
  geom_segment(aes(xend = END_LON, yend = END_LAT), color = "red", size = 1) + 
  theme_void() + 
  coord_map() + 
  facet_wrap(~ EVENT_TYPE, ncol = 3)

## ----echo = FALSE--------------------------------------------------------
events_2015 %>%
  group_by(CZ_TYPE, EVENT_TYPE) %>%
  summarize(n_events = n()) %>%
  ungroup() %>%
  spread(key = CZ_TYPE, value = n_events, fill = 0) %>%
  mutate(total = C + Z,
         perc_county = 100 * C / total) %>%
  arrange(desc(perc_county), desc(total)) %>%
  mutate(C = prettyNum(C, big.mark = ","),
         Z = prettyNum(Z, big.mark = ","),
         total = prettyNum(total, big.mark = ","),
         perc_county = paste0(round(perc_county), "%")) %>%
  knitr::kable(col.names = c("Event type", "County", "Forecast Zone", "Total", "% county"),
               align = "lcccc")

## ----message = FALSE, warning = FALSE, fig.width = 9, fig.height = 6, fig.align = "center", echo = FALSE----
events_2015 %>%
  filter(CZ_TYPE == "C") %>%
  filter(EVENT_TYPE != "Heat") %>%
  filter(!(STATE %in% c("GULF OF MEXICO", "ALASKA", "GUAM", "ATLANTIC NORTH",
                        "LAKE HURON", "LAKE ST CLAIR", "HAWAII", "AMERICAN SAMOA",
                        "LAKE SUPERIOR", "ATLANTIC SOUTH", "LAKE MICHIGAN", 
                        "HAWAII WATERS", "PUERTO RICO", "E PACIFIC", "LAKE ERIE",
                        "LAKE ONTARIO", "VIRGIN ISLANDS"))) %>%
  mutate(CZ_FIPS = str_pad(CZ_FIPS, width = 3, pad = "0"),
         STATE_FIPS = str_pad(STATE_FIPS, width = 2, pad = "0")) %>%
  unite(fips, STATE_FIPS, CZ_FIPS, sep = "") %>%
  mutate(fips = as.numeric(fips)) %>%
  group_by(fips, EVENT_TYPE) %>%
  dplyr::summarize(value = n()) %>%
  ungroup() %>%
  left_join(maps::county.fips, by = "fips") %>%
  left_join(unite(map_data("county"), polyname, region, subregion, sep = ","),
            by = "polyname") %>%
  ggplot(aes(x = long, y = lat, group = group, fill = value)) +
  geom_polygon(color = NA) + 
  geom_polygon(data = map_data("usa"), 
               aes(x = long, y = lat, group = group),
               color = "black", fill = NA) + 
  theme_void() + 
  coord_map() + 
  scale_fill_viridis(option = "A", direction = -1) + 
  facet_wrap(~ EVENT_TYPE) + 
  theme(legend.position = "top") + 
  labs(fill = "Number of events")

## ----echo = FALSE--------------------------------------------------------
events_2015 %>%
  filter(CZ_TYPE == "Z" & EVENT_NARRATIVE != "") %>%
    filter(!(STATE %in% c("GULF OF MEXICO", "ALASKA", "GUAM", "ATLANTIC NORTH",
                        "LAKE HURON", "LAKE ST CLAIR", "HAWAII", "AMERICAN SAMOA",
                        "LAKE SUPERIOR", "ATLANTIC SOUTH", "LAKE MICHIGAN", 
                        "HAWAII WATERS", "PUERTO RICO", "E PACIFIC", "LAKE ERIE",
                        "LAKE ONTARIO", "VIRGIN ISLANDS"))) %>%
  select(STATE, CZ_NAME, EVENT_NARRATIVE) %>%
  sample_n(8) %>%
  mutate(STATE = str_to_title(STATE),
         CZ_NAME = str_to_title(CZ_NAME)) %>%
  as.data.frame() %>% 
  pander::pander(split.cells = c(15, 15, 50), justify = "ccl")

## ----echo = FALSE--------------------------------------------------------
z_events_2015 <- events_2015 %>%
  dplyr::select_(~ BEGIN_YEARMONTH, ~ BEGIN_DAY, ~ END_YEARMONTH, ~ END_DAY,
                   ~ EPISODE_ID, ~EVENT_ID, ~ STATE, ~ CZ_TYPE, ~ CZ_NAME,
                    ~ DEATHS_DIRECT, ~ DEATHS_INDIRECT, ~ INJURIES_DIRECT,
                  ~ INJURIES_INDIRECT, ~ DAMAGE_PROPERTY, ~ DAMAGE_CROPS,
                   ~ EVENT_TYPE, ~ STATE_FIPS, ~ CZ_FIPS, ~ SOURCE,
                   ~ EPISODE_NARRATIVE, ~ EVENT_NARRATIVE) %>%
  setNames(tolower(names(.))) %>%
  dplyr::filter_(~ cz_type == "Z") %>%
  match_forecast_county()

## ----echo = FALSE--------------------------------------------------------
outside_events <- z_events_2015 %>%
  filter(state %in% c("GULF OF MEXICO", "GUAM", "ATLANTIC NORTH",
                                    "LAKE HURON", "LAKE ST CLAIR", "AMERICAN SAMOA",
                                    "LAKE SUPERIOR", "ATLANTIC SOUTH", "LAKE MICHIGAN",
                                    "HAWAII WATERS", "PUERTO RICO", "E PACIFIC", "LAKE ERIE",
                                    "LAKE ONTARIO", "VIRGIN ISLANDS", "HAWAII", "ALASKA")) %>%
  filter(is.na(fips)) 

## ----echo = FALSE--------------------------------------------------------
outside_events %>%
  mutate(state = stringr::str_to_title(state)) %>%
  group_by(state) %>%
  dplyr::summarize(n = n()) %>%
  arrange(desc(n)) %>%
  knitr::kable(col.names = c("State", "Number of events listed by forecast zone"))

## ----echo = FALSE--------------------------------------------------------
continental_events <- z_events_2015 %>%
  filter(!(state %in% c("GULF OF MEXICO", "GUAM", "ATLANTIC NORTH",
                                    "LAKE HURON", "LAKE ST CLAIR", "AMERICAN SAMOA",
                                    "LAKE SUPERIOR", "ATLANTIC SOUTH", "LAKE MICHIGAN",
                                    "HAWAII WATERS", "PUERTO RICO", "E PACIFIC", "LAKE ERIE",
                                    "LAKE ONTARIO", "VIRGIN ISLANDS", "HAWAII", "ALASKA"))) %>%
  filter(is.na(fips)) 

## ----echo = FALSE--------------------------------------------------------
mountain_words <- c("mountains", "mountain", "valley", "valleys", "divide", "range",
                    "ridge", "ridges", "gap", "front", "cascades", "foothills", "plateau",
                    "highlands", "mtns", "hills", "mesa", "mesas", "vly", "peak",
                    "gorge", "rim", "arches", "hole", "canyon")
water_words <- c("beaches", "beach", "river", "basin", "coast", "delta", "lake",
                 "shoreline", "bay")
adjacent_words <- c("area", "region", "vicinity", "country")
other_words <- c("desert", "hwy", "panhandle", "corridor", "nation", "plains", 
                 "lowlands", "prarie")

continental_events <- continental_events %>%
  mutate(cz_name = str_to_lower(cz_name),
         has_mountain_words = str_detect(cz_name, paste0(mountain_words, collapse = "|")),
         has_water_words = str_detect(cz_name, paste0(water_words, collapse = "|")),
         has_adjacent_words = str_detect(cz_name, paste0(adjacent_words, collapse = "|")),
         has_other_words = str_detect(cz_name, paste0(other_words, collapse = "|")))

continental_events %>% 
  summarize(mountain_words = sum(has_mountain_words),
            water_words = sum(has_water_words),
            adjacent_words = sum(has_adjacent_words),
            other_words = sum(has_other_words)) %>% 
  gather(key = word_type, value = n_events) %>%
  mutate(words = c(paste(mountain_words, collapse = ", "),
                   paste(water_words, collapse = ", "),
                   paste(adjacent_words, collapse = ", "),
                   paste(other_words, collapse = ", "))) %>%
  select(word_type, words, n_events) %>%
  mutate(word_type = str_to_title(str_replace(word_type, "_words", ""))) %>%
  dplyr::rename(`Word type` = word_type,
                Words = words,
                `# events` = n_events) %>%
  as.data.frame() %>% 
  pander::pander(split.cells = c(10, 50, 10), big.mark = ",", justify = "llc")

## ----echo = FALSE--------------------------------------------------------
continental_events %>% 
  dplyr::group_by(event_type) %>%
  dplyr::summarize(mountain_words = sum(has_mountain_words),
                   water_words = sum(has_water_words),
                   adjacent_words = sum(has_adjacent_words),
                   other_words = sum(has_other_words)) %>% 
  dplyr::arrange(desc(mountain_words)) %>%
  knitr::kable(col.names = c("Event type", "Mountain words", "Water words", "Adjacent words",
                             "Other words"))

## ----echo = FALSE--------------------------------------------------------
continental_events %>% 
  filter(!has_mountain_words & !has_water_words & !has_adjacent_words & !has_other_words) %>%
  select(cz_name, state) %>% 
  mutate(cz_name = str_to_title(cz_name),
         state = str_to_title(state)) %>%
  distinct() %>%
  knitr::kable()

## ----message = FALSE, warning = FALSE, fig.width = 9, fig.height = 6, fig.align = "center", echo = FALSE----
z_events_2015 %>%
  filter(!is.na(fips)) %>%
  filter(!(state %in% c("GULF OF MEXICO", "ALASKA", "GUAM", "ATLANTIC NORTH",
                        "LAKE HURON", "LAKE ST CLAIR", "HAWAII", "AMERICAN SAMOA",
                        "LAKE SUPERIOR", "ATLANTIC SOUTH", "LAKE MICHIGAN", 
                        "HAWAII WATERS", "PUERTO RICO", "E PACIFIC", "LAKE ERIE",
                        "LAKE ONTARIO", "VIRGIN ISLANDS"))) %>%
  group_by(event_type) %>%
  dplyr::mutate(n_events = n()) %>%
  ungroup() %>%
  filter(n_events >= 100) %>%
  select(-n_events) %>%
  group_by(fips, event_type) %>%
  dplyr::summarize(value = n()) %>%
  ungroup() %>%
  left_join(maps::county.fips, by = "fips") %>%
  left_join(unite(map_data("county"), polyname, region, subregion, sep = ","),
            by = "polyname") %>%
  ggplot(aes(x = long, y = lat, group = group, fill = value)) +
  geom_polygon(color = NA) + 
  geom_polygon(data = map_data("usa"), 
               aes(x = long, y = lat, group = group),
               color = "black", fill = NA) + 
  theme_void() + 
  coord_map() + 
  scale_fill_viridis(option = "A", direction = -1) + 
  facet_wrap(~ event_type) + 
  theme(legend.position = "top") + 
  labs(fill = "Number of events")

## ----eval = FALSE--------------------------------------------------------
#  z_events_2015 %>%
#    filter(cz_type == "Z") %>%
#    select(cz_name, state, fips) %>%
#    mutate(cz_name = str_to_title(cz_name)) %>%
#    filter(str_detect(cz_name, "Lake") & !is.na(fips))  %>%
#    distinct()

## ----echo = FALSE--------------------------------------------------------
c_events_2015 <- events_2015 %>%
  dplyr::select_(~ BEGIN_YEARMONTH, ~ BEGIN_DAY, ~ END_YEARMONTH, ~ END_DAY,
                   ~ EPISODE_ID, ~EVENT_ID, ~ STATE, ~ CZ_TYPE, ~ CZ_NAME,
                  ~ DEATHS_DIRECT, ~ DEATHS_INDIRECT, ~ INJURIES_DIRECT,
                  ~ INJURIES_INDIRECT, ~ DAMAGE_PROPERTY, ~ DAMAGE_CROPS,
                   ~ EVENT_TYPE, ~ STATE_FIPS, ~ CZ_FIPS, ~ SOURCE,
                   ~ EPISODE_NARRATIVE, ~ EVENT_NARRATIVE) %>%
  setNames(tolower(names(.))) %>%
  dplyr::filter_(~ cz_type == "C") %>%
  dplyr::mutate_(fips = ~ as.numeric(paste0(state_fips, str_pad(cz_fips, 3, pad = "0"))))

county_events_2015 <- bind_rows(c_events_2015, filter(z_events_2015, !is.na(fips)))

## ------------------------------------------------------------------------
county_events_2015 %>% filter(event_id == "582970")

## ------------------------------------------------------------------------
parse_damage

## ----echo = FALSE--------------------------------------------------------
county_damage_2015 <- county_events_2015 %>%
  dplyr::select(episode_id , event_id, fips, event_type, contains("damage")) %>% 
  tidyr::gather(key = impact, value = amount, -event_type, -event_id, -episode_id, -fips) %>%
  dplyr::mutate(amount = parse_damage(amount)) 

## ----echo = FALSE--------------------------------------------------------
county_events_2015 %>%
  filter(episode_id == "100823" & fips == 45035) %>%
  select(event_type, contains("damage"), cz_name, state, event_narrative, episode_narrative) %>% 
  as.data.frame() %>% 
  pander::pander()

## ----echo = FALSE--------------------------------------------------------
county_events_2015 %>%
  filter(episode_id == "99142" & fips == 2023) %>%
  select(event_type, contains("damage"), cz_name, state, event_narrative, episode_narrative) %>% 
  as.data.frame() %>% 
  pander::pander()

## ----echo = FALSE--------------------------------------------------------
a <- county_damage_2015 %>%
  group_by(event_id) %>%
  summarize(episode_id = first(episode_id),
            fips = first(fips),
            total_amount = sum(amount)) %>%
  ungroup() %>% 
  group_by(episode_id, fips) %>% 
  summarize(n_events = n(),
            average_amount = mean(total_amount),
            max_amount = max(total_amount),
            range_amount = diff(range(total_amount))) %>%
  filter(!is.na(max_amount) & max_amount > 0 & n_events > 1) %>% 
  ungroup() %>%
  mutate(zero_range = range_amount == 0) %>%
  group_by(zero_range) %>%
  count()

## ----echo = FALSE, warning = FALSE, message = FALSE----------------------
county_damage_2015 %>%
  left_join(county_events_2015 %>% select(fips, cz_name, state, episode_narrative, event_id)) %>%
  unite(location, cz_name, state, sep = ", ") %>% 
  group_by(episode_id) %>%
  summarize(location = paste(unique(stringr::str_to_title(location)), collapse = "; "),
            episode_damage = sum(amount, na.rm = TRUE),
            event_types = paste(unique(event_type), collapse = ", "),
            episode_narrative = first(episode_narrative)) %>%
  ungroup() %>%
  arrange(desc(episode_damage)) %>%
  mutate(episode_damage = formatC(episode_damage, format = "d", big.mark = ","),
         episode_damage = paste0("$", episode_damage)) %>%
  slice(1:10) %>%
  select(event_types, episode_damage, location, episode_narrative) %>%
  rename(`Event types` = event_types,
         `Total damage` = episode_damage,
         Counties = location,
         Narrative = episode_narrative) %>% 
  as.data.frame() %>% 
  pander::pander(split.cells = c(5, 5, 15, 35), justify = "lcll") 

## ----echo = FALSE--------------------------------------------------------
county_damage_2015 %>% 
  group_by(event_type) %>%
  dplyr::mutate(tot_amount = sum(amount)) %>%
  ungroup() %>%
  filter(amount > 0) %>%
  dplyr::mutate(event_type = forcats::fct_reorder(event_type, tot_amount, .desc = TRUE)) %>%
  group_by(event_type) %>%
  dplyr::summarize(n_non_zero = n(),
                   total = sum(amount),
                   median = median(amount),
                   max = max(amount)) %>%
  arrange(desc(total)) %>% 
  mutate(n_non_zero = prettyNum(n_non_zero, big.mark = ","),
         total = paste0("$", formatC(total, format = "d", big.mark = ",")),
         median = paste0("$", formatC(median, format = "d", big.mark = ",")),
         max = paste0("$", formatC(max, format = "d", big.mark = ","))) %>%
  knitr::kable(col.names = c("Event type", "# Events", "Total damage", "Median damage", 
                             "Maximum damage"))

## ----echo = FALSE, fig.width = 6, fig.height = 7-------------------------
county_damage_2015 %>% 
  filter(!is.na(amount)) %>% 
  group_by(event_id) %>% 
  mutate(amount = sum(amount)) %>% 
  ungroup() %>% 
  mutate(no_damage = amount == 0,
         no_damage = factor(no_damage, 
                            levels = c(FALSE, TRUE),
                            labels = c("Damage", "No damage"))) %>% 
  group_by(event_type, no_damage) %>% 
  count() %>% 
  ggplot(aes(x = fct_reorder(event_type, n, fun = sum), y = n, fill = no_damage)) + 
  geom_bar(stat = "identity") + 
  coord_flip() + 
  theme_classic() + 
  theme(legend.position = "top") + 
  scale_fill_viridis(name = " ", discrete = TRUE, option = "D", begin = 0.3, end = 0.8,
                     direction = -1) + 
  labs(x = "", y = "Number of events")

## ----fig.height = 10, fig.width = 7, fig.align = "center", echo = FALSE----
ex <- county_events_2015 %>% 
  filter(str_to_lower(state) %in% as.character(state.fips$polyname)) %>% 
  unite(begin_date, begin_yearmonth, begin_day, sep = "-") %>% 
  mutate(begin_date = ymd(begin_date)) %>% 
  unite(end_date, end_yearmonth, end_day, sep = "-") %>% 
  mutate(end_date = ymd(end_date)) %>% 
  mutate(damage_property = parse_damage(damage_property),
         damage_crops = parse_damage(damage_crops),
         state = str_to_title(state)) %>% 
  select(begin_date, end_date, episode_id, state, damage_property, damage_crops, event_type) %>% 
  gather(key = damage_type, value = damage, contains("damage")) %>% 
  group_by(episode_id) %>% 
  summarize(begin_date = min(begin_date),
            end_date = max(end_date),
            state = first(state),
            event_type = paste(unique(event_type), collapse = ", "),
            damage = sum(damage)) %>% 
  arrange(desc(damage)) %>% 
  slice(1:50) %>% 
  arrange(state, begin_date) %>% 
  mutate(n = 1:n(),
         damage_text = ifelse(damage == 0, "", 
                              paste0("$", formatC(damage, format = "d", big.mark = ","))))

ggplot(ex, aes(x = begin_date, y = n, color = state)) + 
  geom_segment(aes(xend = end_date, yend = n)) + 
  geom_point(size = 0.2) + 
  geom_point(aes(x = end_date), size = 0.2) +
  theme_classic() + 
  theme(legend.position = "bottom",
        axis.title.y = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.line.y = element_blank()) + 
  geom_text(aes(label = event_type, x = begin_date - 2), 
            hjust = "right", size = 2, color = "black") + 
  geom_text(aes(label = damage_text, x = end_date + 2), 
            hjust = "left", size = 2, color = "black") +  
  labs(color = "") + 
  scale_x_date(name = "Episode date", 
               breaks = ymd(c(20150101, 20150301, 20150501, 
                                   20150701, 20150901, 20151101,
                              20160101)), 
               date_labels = "%b",
               limits = c(ymd(20141001), ymd(20160201)))

