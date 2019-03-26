library(seeclickfixr)


### Name: list_places
### Title: Query sub-city neighborhoods in which issues can be reported.
### Aliases: list_places

### ** Examples

list_places("Boston, MA",limit = 5)

## Returns:
# id           name        url_name    county         state   place_type
# 1 28632        Central central_suffolk   Suffolk            MA Neighborhood
# 2 72870       Downtown downtown_boston  Downtown            MA Neighborhood
# 3 72869      North End northend_boston North End            MA Neighborhood
# 4 72838    Beacon Hill     beacon_hill           Massachusetts Neighborhood
# 5 28631 East Cambridge  east-cambridge Middlesex            MA Neighborhood
# url                                html_url
# 1 https://seeclickfix.com/api/v2/places/28632 https://seeclickfix.com/central_suffolk
# 2 https://seeclickfix.com/api/v2/places/72870 https://seeclickfix.com/downtown_boston
# 3 https://seeclickfix.com/api/v2/places/72869 https://seeclickfix.com/northend_boston
# 4 https://seeclickfix.com/api/v2/places/72838     https://seeclickfix.com/beacon_hill
# 5 https://seeclickfix.com/api/v2/places/28631  https://seeclickfix.com/east-cambridge
# html_report_url  type      lat       lng
# 1 https://seeclickfix.com/central_suffolk/report Point 42.35854 -71.05931
# 2 https://seeclickfix.com/downtown_boston/report Point 42.35630 -71.05707
# 3 https://seeclickfix.com/northend_boston/report Point 42.36534 -71.05325
# 4     https://seeclickfix.com/beacon_hill/report Point 42.35716 -71.06791
# 5  https://seeclickfix.com/east-cambridge/report Point 42.36833 -71.07928



