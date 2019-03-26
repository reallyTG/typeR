library(xlm)


### Name: getTradeAggregations
### Title: Returns trade aggregations.
### Aliases: getTradeAggregations

### ** Examples

start_time="1512689100000"
end_time="1534924458000"
resolution="300000"
base_asset_type="native"
counter_asset_type="credit_alphanum4"
counter_asset_code="BTC"
counter_asset_issuer = "GATEMHCCKCY67ZUCKTROYN24ZYT5GK4EQZ65JJLDHKHRUZI3EUEKMTCH"

getTradeAggregations(start_time, end_time, resolution,
base_asset_type = base_asset_type, counter_asset_type = counter_asset_type,
counter_asset_code = counter_asset_code, counter_asset_issuer = counter_asset_issuer)



