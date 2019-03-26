library(sergeant)


### Name: src_drill
### Title: Connect to Drill (dplyr)
### Aliases: src_drill tbl.src_drill

### ** Examples

## Not run: 
##D db <- src_drill("localhost", 8047L)
##D 
##D print(db)
##D ## src:  DrillConnection
##D ## tbls: INFORMATION_SCHEMA, cp.default, dfs.default, dfs.root, dfs.tmp, sys
##D 
##D emp <- tbl(db, "cp.`employee.json`")
##D 
##D count(emp, gender, marital_status)
##D ## # Source:   lazy query [?? x 3]
##D ## # Database: DrillConnection
##D ## # Groups:   gender
##D ##   marital_status gender     n
##D ##            <chr>  <chr> <int>
##D ## 1              S      F   297
##D ## 2              M      M   278
##D ## 3              S      M   276
##D 
##D # Drill-specific SQL functions are also available
##D select(emp, full_name) %>%
##D   mutate(        loc = strpos(full_name, "a"),
##D          first_three = substr(full_name, 1L, 3L),
##D                  len = length(full_name),
##D                   rx = regexp_replace(full_name, "[aeiouAEIOU]", "*"),
##D                  rnd = rand(),
##D                  pos = position("en", full_name),
##D                  rpd = rpad(full_name, 20L),
##D                 rpdw = rpad_with(full_name, 20L, "*"))
##D ## # Source:   lazy query [?? x 9]
##D ## # Database: DrillConnection
##D ##      loc         full_name   len                 rpdw   pos                rx
##D ##    <int>             <chr> <int>                <chr> <int>             <chr>
##D ##  1     0      Sheri Nowmer    12 Sheri Nowmer********     0      Sh*r* N*wm*r
##D ##  2     0   Derrick Whelply    15 Derrick Whelply*****     0   D*rr*ck Wh*lply
##D ##  3     5    Michael Spence    14 Michael Spence******    11    M*ch**l Sp*nc*
##D ##  4     2    Maya Gutierrez    14 Maya Gutierrez******     0    M*y* G*t**rr*z
##D ##  5     7   Roberta Damstra    15 Roberta Damstra*****     0   R*b*rt* D*mstr*
##D ##  6     7  Rebecca Kanagaki    16 Rebecca Kanagaki****     0  R*b*cc* K*n*g*k*
##D ##  7     0       Kim Brunner    11 Kim Brunner*********     0       K*m Br*nn*r
##D ##  8     6   Brenda Blumberg    15 Brenda Blumberg*****     3   Br*nd* Bl*mb*rg
##D ##  9     2      Darren Stanz    12 Darren Stanz********     5      D*rr*n St*nz
##D ## 10     4 Jonathan Murraiin    17 Jonathan Murraiin***     0 J*n*th*n M*rr***n
##D ## # ... with more rows, and 3 more variables: rpd <chr>, rnd <dbl>, first_three <chr>
## End(Not run)



