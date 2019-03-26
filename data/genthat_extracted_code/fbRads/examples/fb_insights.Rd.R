library(fbRads)


### Name: fb_insights
### Title: Insights
### Aliases: fb_insights

### ** Examples

## Not run: 
##D fb_insights(fbacc)
##D 
##D ## process results
##D l <- fb_insights(fbacc, date_preset = 'today', level = 'ad')
##D library(rlist)
##D list.stack(list.select(l, date_start, date_stop, ad_id, total_actions,
##D   total_unique_actions, total_action_value, impressions, unique_impressions,
##D   social_impressions, unique_social_impressions, clicks, unique_clicks,
##D   social_clicks, unique_social_clicks, spend, frequency, deeplink_clicks,
##D   app_store_clicks, website_clicks, reach, social_reach, ctr, unique_ctr,
##D   cpc, cpm, cpp, cost_per_total_action, cost_per_unique_click,
##D   relevance_score = relevance_score$score))
## End(Not run)



