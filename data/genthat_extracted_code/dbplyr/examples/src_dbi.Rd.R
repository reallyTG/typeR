library(dbplyr)


### Name: src_dbi
### Title: dplyr backend for any DBI-compatible database
### Aliases: src_dbi tbl.src_dbi tbl_dbi

### ** Examples

# Basic connection using DBI -------------------------------------------
library(dplyr)

con <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")
src <- src_dbi(con, auto_disconnect = TRUE)

# Add some data
copy_to(src, mtcars)
src
DBI::dbListTables(con)

# To retrieve a single table from a source, use `tbl()`
src %>% tbl("mtcars")

# You can also use pass raw SQL if you want a more sophisticated query
src %>% tbl(sql("SELECT * FROM mtcars WHERE cyl == 8"))

# Alternatively, you can use the `src_sqlite()` helper
src2 <- src_sqlite(":memory:", create = TRUE)

# If you just want a temporary in-memory database, use src_memdb()
src3 <- src_memdb()

# To show off the full features of dplyr's database integration,
# we'll use the Lahman database. lahman_sqlite() takes care of
# creating the database.

if (has_lahman("sqlite")) {
lahman_p <- lahman_sqlite()
batting <- lahman_p %>% tbl("Batting")
batting

# Basic data manipulation verbs work in the same way as with a tibble
batting %>% filter(yearID > 2005, G > 130)
batting %>% select(playerID:lgID)
batting %>% arrange(playerID, desc(yearID))
batting %>% summarise(G = mean(G), n = n())

# There are a few exceptions. For example, databases give integer results
# when dividing one integer by another. Multiply by 1 to fix the problem
batting %>%
  select(playerID:lgID, AB, R, G) %>%
  mutate(
   R_per_game1 = R / G,
   R_per_game2 = R * 1.0 / G
 )

# All operations are lazy: they don't do anything until you request the
# data, either by `print()`ing it (which shows the first ten rows),
# or by `collect()`ing the results locally.
system.time(recent <- filter(batting, yearID > 2010))
system.time(collect(recent))

# You can see the query that dplyr creates with show_query()
batting %>%
  filter(G > 0) %>%
  group_by(playerID) %>%
  summarise(n = n()) %>%
  show_query()
}



